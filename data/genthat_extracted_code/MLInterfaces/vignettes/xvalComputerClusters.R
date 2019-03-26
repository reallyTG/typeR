### R code from vignette source 'xvalComputerClusters.Rnw'

###################################################
### code chunk number 1: xvalComputerClusters.Rnw:34-35
###################################################
options(width=60)


###################################################
### code chunk number 2: init
###################################################
library(MLInterfaces)
library(golubEsets)
data(Golub_Merge)
smallG <- Golub_Merge[200:250,]


###################################################
### code chunk number 3: xval
###################################################
lk1 <- MLearn(ALL.AML~., smallG, knnI(k=1), xvalSpec("LOO"))
confuMat(lk1)


###################################################
### code chunk number 4: clusterinit (eval = FALSE)
###################################################
## library(MLInterfaces)
## library(golubEsets)
## smallG <- Golub_Merge[200:250,]


###################################################
### code chunk number 5: clusterstart (eval = FALSE)
###################################################
## library(snow)
## cl <- makeCluster(8, "MPI")
## clusterEvalQ(cl, library(MLInterfaces))


###################################################
### code chunk number 6: clustercalc (eval = FALSE)
###################################################
## lk1 <- xval(smallG, "ALL.AML", knnB, xvalMethod="LOO", 
##             group=as.integer(0), cluster = cl)
## table(lk1,smallG$ALL.AML)


###################################################
### code chunk number 7: xvalComputerClusters.Rnw:113-116 (eval = FALSE)
###################################################
## setMethod("xvalLoop", 
##           signature( cluster = "ANY" ),
##           function( cluster, ... ) lapply )


###################################################
### code chunk number 8: xvalComputerClusters.Rnw:133-137 (eval = FALSE)
###################################################
## setOldClass( "spawnedMPIcluster" )
## setMethod("xvalLoop",
##           signature( cluster = "spawnedMPIcluster" ),
##           function( cluster, ... ) parLapply )


###################################################
### code chunk number 9: xvalComputerClusters.Rnw:151-160 (eval = FALSE)
###################################################
## setOldClass( "spawnedMPIcluster" )
## setMethod("xvalLoop",
## signature( cluster = "spawnedMPIcluster" ),
## function( cluster, ... ) {
##     relapply <- function(X, FUN, ...) {
##         parLapply( cluster, X, FUN, ... )
##     }
##     relapply
## })


###################################################
### code chunk number 10: xvalComputerClusters.Rnw:179-196 (eval = FALSE)
###################################################
## setMethod("xvalLoop", signature( cluster = "spawnedMPIcluster"),
## function( cluster, ... ) {
##     clusterExportEnv <- function (cl, env = .GlobalEnv)
##     {
##         unpackEnv <- function(env) {
##             for ( name in ls(env) ) assign(name, get(name, env), .GlobalEnv )
##             NULL
##         }
##         clusterCall(cl, unpackEnv, env)
##     }
##     relapply <- function(X, FUN, ...) {
##         ## send all visible variables from the parent (i.e., xval) frame
##         clusterExportEnv( cluster, parent.frame(1) )
##         parLapply( cluster, X, FUN, ... )
##     }
##     relapply
## })


###################################################
### code chunk number 11: xvalComputerClusters.Rnw:208-210
###################################################
res <- c(20.04,11.34, 9.23, 8.20, 7.87)
plot(res,ylab="Time (seconds)", xlab="Nodes", ylim=c(0,max(res)))


###################################################
### code chunk number 12: xvalComputerClusters.Rnw:221-234 (eval = FALSE)
###################################################
## harness <- function( nodes, reps, data ) {
##     if ( nodes > 1) {
##         cl <- makeCluster(nodes, "MPI")
##         clusterEvalQ(cl, library(MLInterfaces))
##     } else cl <- NULL
##     func <- function(x)
##         res <- xval(data, "ALL.AML", knnB, xvalMethod = "LOO", 0:0, cluster = cl )
##     func()                              # warm-up
##     tm <- system.time( sapply( 1:reps, func ) )[3]
##     if (nodes > 1) stopCluster(cl)
##     tm
## }
## res <- sapply( 1:5, harness, 10, smallG )


###################################################
### code chunk number 13: xvalComputerClusters.Rnw:279-286
###################################################
x <- 1:10
for (i in 1:10) x[i] <- i**2
x # x has been modified by the for loop

x <- 1:10
res <- lapply(1:10, function(i) x[i] <- i**2)
x # copy of x in lapply modified, not the global x


