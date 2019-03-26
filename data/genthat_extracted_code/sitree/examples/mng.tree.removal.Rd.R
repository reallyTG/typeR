library(sitree)


### Name: mng.tree.removal
### Title: Function to remove trees
### Aliases: mng.tree.removal

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
  vars.required  = c("vol.wo.tr.m3.ha", "vuprha.m3.h"),
  period.length = 5,
  species.spruce = c(1, 2, 3),
  species.pine = c(10, 11, 20, 21, 29),
  species.harw = c(30, 31)
)

fl$management <- data.frame(matrix(NA, ncol = tr.i$nperiods,
                                   nrow = length(fl$plot.id)))
names(fl$management) <- paste0("t", 1:tr.i$nperiods)

management <- management.prob(tr.i,
                fl,
                fun.final.felling = "harv.prob",
                fun.thinning = "thin.prob",
                common.vars = common.vars$res,
                this.period = "t0",
                next.period = "t1")
fl$management[, "t1"] <- management$management
remove.tree <- mng.tree.removal(tr = tr.i,
                                fl = fl,
                                common.vars = common.vars$res,
                                this.period = "t0",
                                next.period = "t1",
                                per.vol.harv =  0.83 )
sum(remove.tree)



