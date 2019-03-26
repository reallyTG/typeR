library(mc2d)


### Name: cornode
### Title: Builds a Rank Correlation using the Iman and Connover Method.
### Aliases: cornode
### Keywords: multivariate

### ** Examples

x1 <- rnorm(1000)
x2 <- rnorm(1000)
x3 <- rnorm(1000)
mat <- cbind(x1, x2, x3)
## Target
(corr <- matrix(c(1, 0.5, 0.2, 0.5, 1, 0.2, 0.2, 0.2, 1), ncol=3))
## Before
cor(mat, method="spearman")
matc <- cornode(mat, target=corr, result=TRUE)
## The first row is unchanged
all(matc[, 1] == mat[, 1])

##Using mcnode and outrank
cook <- mcstoc(rempiricalD, values=c(0, 1/5, 1/50), prob=c(0.027, 0.373, 0.600), nsv=1000)
serving <- mcstoc(rgamma, shape=3.93, rate=0.0806, nsv=1000)
roundserv <- mcdata(round(serving), nsv=1000)
## Strong relation between roundserv and serving (of course)
cor(cbind(cook, roundserv, serving), method="spearman")

##The classical way to build the correlation structure 
matcorr <- matrix(c(1, 0.5, 0.5, 1), ncol=2)
matc <- cornode(cook=cook, roundserv=roundserv, target=matcorr)
## The structure between cook and roundserv is OK but ...
## the structure between roundserv and serving is lost
cor(cbind(cook=matc$cook, serv=matc$roundserv, serving), method="spearman")

##An alternative way to build the correlation structure
matc <- cornode(cook=cook, roundserv=roundserv, target=matcorr, outrank=TRUE)
## Rebuilding the structure
roundserv[] <- roundserv[matc$roundserv, , ]
serving[] <- serving[matc$roundserv, , ]
## The structure between cook and roundserv is OK and ...
## the structure between roundserv and serving is preserved
cor(cbind(cook, roundserv, serving), method="spearman")



