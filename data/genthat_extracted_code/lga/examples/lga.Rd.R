library(lga)


### Name: lga
### Title: Perform LGA/RLGA
### Aliases: lga lga.default rlga rlga.default
### Keywords: multivariate cluster

### ** Examples


## Synthetic Data
## Make a dataset with 2 clusters in 2 dimensions

library(MASS)
set.seed(1234)
X <- rbind(mvrnorm(n=100, mu=c(1,-1), Sigma=diag(0.1,2)+0.9),
            mvrnorm(n=100, mu=c(1,1), Sigma=diag(0.1,2)+0.9))

lgaout <- lga(X,2)
plot(lgaout)
print(lgaout)

## Robust equivalent

rlgaout <- rlga(X,2, alpha=0.75)
plot(rlgaout)
print(rlgaout)


## nhl94 data set

data(nhl94)
plot(lga(nhl94, k=3, niter=30))


## Allometry data set
data(brain)
plot(lga(log(brain, base=10), k=3))


## Second Allometry data set
data(ob)
plot(lga(log(ob[,2:3]), k=3), pch=as.character(ob[,1]))

## Corridor Walls data set
## To obtain the results reported in Garcia-Escudero et al. (2008):
data(corridorWalls)
rlgaout <- rlga(corridorWalls, k=3, biter = 100, niter = 30, alpha=0.85)
pairs(corridorWalls, col=rlgaout$cluster+1)
plot(rlgaout)

## Parallel processing case
## In this example, running using 4 nodes. 

## Not run: 
##D set.seed(1234)
##D X <- rbind(mvrnorm(n=1e6, mu=c(1,-1), Sigma=diag(0.1,2)+0.9),
##D             mvrnorm(n=1e6, mu=c(1,1), Sigma=diag(0.1,2)+0.9))
##D abc <- lga(X, k=2, nnode=4)
## End(Not run)




