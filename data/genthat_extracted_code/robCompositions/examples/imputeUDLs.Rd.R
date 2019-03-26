library(robCompositions)


### Name: imputeUDLs
### Title: Imputation of values above an upper detection limit in
###   compositional data
### Aliases: imputeUDLs
### Keywords: manip multivariate

### ** Examples

data(gemas)  # read data
dat <- gemas[gemas$COUNTRY=="HEL",c(12:29)]
UDL <- apply(dat,2,max)
names(UDL) <- names(dat)
UDL["Mn"] <- quantile(dat[,"Mn"], probs = 0.8)  # UDL present only in one variable
whichudl <- dat[,"Mn"] > UDL["Mn"] 
# classical method
imp.lm <- dat
imp.lm[whichudl,"Mn"] <- Inf
res.lm <- imputeUDLs(imp.lm, dl=UDL, method="lm", variation=TRUE)
imp.lm <- res.lm$x





