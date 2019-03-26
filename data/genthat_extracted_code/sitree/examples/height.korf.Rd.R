library(sitree)


### Name: height.korf
### Title: Simple height function
### Aliases: height.korf

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
  this.period    = "t0",
  i.period       = 0,
  common.vars    = "NULL",
  mng.options    = NA,
  vars.required  = c("spp"),
  period.length = 5,
  species.spruce = c(1, 2, 3),
  species.pine = c(10, 11, 20, 21, 29),
  species.harw = c(30, 31)
)
height.korf(common.vars = common.vars$res, this.period = 't0', 
    tr.i, fl, dbh.inc.mm = runif(nrow(tr.i$data$dbh.mm), 5, 80)) 



