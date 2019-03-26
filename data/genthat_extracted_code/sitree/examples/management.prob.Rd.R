library(sitree)


### Name: management.prob
### Title: Final felling and thinning functions for Norwegian forest
### Aliases: harv.prob management.prob thin.prob

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
  vars.required  = c("spp", "SBA.m2.ha", "QMD.cm", "vuprha.m3.ha", "AgeTo5"),
  period.length = 5,
  species.spruce = c(1, 2, 3),
  species.pine = c(10, 11, 20, 21, 29),
  species.harw = c(30, 31)
)
fl$management <- data.frame(matrix(NA, ncol = tr.i$nperiods,
                                   nrow = nrow(tr.i$data$dbh.mm)))
names(fl$management) <- paste0("t", 1:tr.i$nperiods)

management.prob(tr.i,
                fl,
                fun.final.felling = "harv.prob",
                fun.thinning = "thin.prob",
                common.vars = common.vars$res,
                this.period = "t0",
                next.period = "t1")

harv.prob(region = fl$region[1:3],
          skidding.distance.100m = fl$skidding.distance.100[1:3],
          AgeTo5 = c(50, 20, 15),
          vuprha.m3.ha = common.vars$res$vuprha.m3.ha[1:3],
          slope.per = fl$slope.per[1:3],
          SI.m = fl$SI.m[1:3],
          SI.spp = fl$SI.spp[1:3])

thin.prob(region = fl$region[1:3],
          skidding.distance.100m = fl$skidding.distance.100[1:3],
          AgeTo5 = c(50, 20, 15),
          vuprha.m3.ha = common.vars$res$vuprha.m3.ha[1:3],
          slope.per = fl$slope.per[1:3],
          SI.m = fl$SI.m[1:3],
          SI.spp = fl$SI.spp[1:3]
)




