library(clusterSEs)


### Name: cluster.bs.mlogit
### Title: Pairs Cluster Bootstrapped p-Values For mlogit
### Aliases: cluster.bs.mlogit

### ** Examples

## Not run: 
##D 
##D #######################################
##D # example one: train ticket selection
##D #######################################
##D # see http://cran.r-project.org/web/packages/mlogit/vignettes/mlogit.pdf
##D require(mlogit)
##D data("Train", package="mlogit")
##D Train$ch.id <- paste(Train$id, Train$choiceid, sep=".")
##D Tr <- mlogit.data(Train, shape = "wide", choice = "choice", varying = 4:11,
##D                   sep = "_", alt.levels = c(1, 2), id = "id")
##D Tr$price <- Tr$price/100 * 2.20371
##D Tr$time <- Tr$time/60
##D ml.Train <- mlogit(choice ~ price + time + change + comfort | -1, Tr)
##D 
##D # compute pairs cluster bootstrapped p-values
##D # note: few reps to speed up example
##D cluster.bs.tr <- cluster.bs.mlogit(ml.Train, Tr, ~ id, boot.reps=100)
##D 
##D 
##D ##################################################################
##D # example two: predict type of heating system installed in house
##D ##################################################################
##D require(mlogit)
##D data("Heating", package = "mlogit")
##D H <- Heating
##D H.ml <- mlogit.data(H, shape="wide", choice="depvar", varying=c(3:12))
##D m <- mlogit(depvar~ic+oc, H.ml)
##D 
##D # compute pairs cluster bootstrapped p-values
##D cluster.bs.h <- cluster.bs.mlogit(m, H.ml, ~ region, boot.reps=1000)
##D 
## End(Not run)



