library(sitree)


### Name: dbhi.BN2009
### Title: DBH Increment Function by Bollandsas and Naesset (2009)
### Aliases: dbhi.BN2009
### Keywords: ~kwd1 ~kwd2

### ** Examples

foo.matrix <-  matrix(0, nrow = length(tr$dbh), ncol = (5 +1))
colnames(foo.matrix) <- paste("t", 0:5, sep = "")
foo.dbh <- foo.height <- foo.matrix
foo.dbh[,1] <- tr$dbh
foo.height[,1] <- tr$height

trl <- list(
  plot.id  = tr$plot.id,
  treeid    = tr$treeid,
  dbh.mm    = foo.dbh,
  height.dm = foo.height,
  yrs.sim   = rep(0, nrow(tr)),
  tree.sp   = factor(tr$tree.sp)
)
tr.i <- trList$new(data = trl, nperiods = as.integer(5))

common.vars <-  prep.common.vars.fun(
  tr = tr.i,
  fl = fl,
  i.period       = 0,
  this.period    = "t0",
  common.vars    = "NULL",
  vars.required  = c("QMD.cm", "i.stand"),
  period.length = 5,
  species.spruce = c(1, 2, 3),
  species.pine = c(10, 11, 20, 21, 29),
  species.harw = c(30, 31)
)
 
dbhi.BN2009(tr.i, fl, common.vars$res , this.period = "t0",
            species.spruce = c(1, 2, 3),
            species.pine =  c(10, 11, 20, 21, 29),
            species.harw =  c(30, 31))



