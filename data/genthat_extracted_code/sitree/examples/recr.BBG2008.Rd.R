library(sitree)


### Name: recr.BBG2008
### Title: Recruitment function following BBG2008
### Aliases: recr.BBG2008 BBG2008

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

## create a fake dead trees and removed trees.

common.vars <-  prep.common.vars.fun(
  tr = tr.i,
  fl = fl,
  this.period    = "t0",
  i.period       = 0,
  common.vars    = "NULL",
  mng.options    = NA,
  vars.required  = c("spp", "SBA.m2.ha", "pr.spru.ba"),
  period.length = 5,
  species.spruce = c(1, 2, 3),
  species.pine = c(10, 11, 20, 21, 29),
  species.harw = c(30, 31)
)

recr <- recr.BBG2008(tr.i, fl, common.vars$res, i.period = 0, this.period = "t0",
                     next.period = "t1")
str(recr)
bbg <- BBG2008 (common.vars$res$SBA.m2.ha[common.vars$res$i.tree],
                fl$SI.m,
                common.vars$res$pr.spp.ba$spru[common.vars$res$i.tree],
                common.vars$res$pr.spp.ba$pine[common.vars$res$i.tree],
                common.vars$res$pr.spp.ba$birch[common.vars$res$i.tree], 
                common.vars$res$pr.spp.ba$other[common.vars$res$i.tree])
str(bbg)



