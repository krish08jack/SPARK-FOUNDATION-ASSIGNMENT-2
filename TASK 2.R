data<-read.csv("Iris.csv")
data
#You can do partitioning around medoids to estimate the number of clusters using the pamk function in the fpc package.

library(cluster)
library(factoextra)
n = 150
g = 6 
set.seed(g)
d <- data.frame(x = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))), 
                y = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))))
plot(d)
library(fpc)
pamk.best <- pamk(d)
cat("number of clusters estimated by optimum average silhouette width:", pamk.best$nc, "\n")
plot(pam(d, pamk.best$nc))
