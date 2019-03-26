library(sitree)


### Name: grow.dbhinc.hgtinc
### Title: Growth and Height Increment Function Wrapper
### Aliases: grow.dbhinc.hgtinc

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
  vars.required  = c("spp", "SBA.m2.ha", "QMD.cm"),
  period.length = 5,
  species.spruce = c(1, 2, 3),
  species.pine = c(10, 11, 20, 21, 29),
  species.harw = c(30, 31)
)


grow.dbhinc.hgtinc (tr = tr.i,
                    fl = fl,
                    common.vars = common.vars$res,
                    this.period = "t0",
                    functions = list(
                        fn.growth     = 'grow.dbhinc.hgtinc',
                        fn.dbh.inc = "dbhi.BN2009",
                        fn.hgt.inc =  "height.korf", 
                        fn.mort       = 'mort.B2007',
                        fn.recr       = 'recr.BBG2008',
                        fn.management = 'management.prob',
                        fn.tree.removal = 'mng.tree.removal',
                        fn.modif      = NULL, #'ext.modif.fun',
                        fn.prep.common.vars = 'prep.common.vars.fun'
                    ),
                    species.spruce = c(1, 2, 3),
                    species.pine =  c(10, 11, 20, 21, 29),
                    species.harw =  c(30, 31)
                    )




