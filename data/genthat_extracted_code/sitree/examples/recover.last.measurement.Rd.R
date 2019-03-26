library(sitree)


### Name: recover.last.measurement
### Title: Recover dbh and height at time of death
### Aliases: recover.last.measurement

### ** Examples

set.seed(2017)
res <- sitree (tree.df   = tr,
                stand.df  = fl,
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
                n.periods = 5,
                period.length = 5,
                mng.options = NA,
                print.comments = FALSE,
                species.spruce = c(1, 2, 3),
                species.pine = c(10, 11, 20, 21, 29),
                species.harw = c(30, 31),
                fun.final.felling = "harv.prob",
                fun.thinning      = "thin.prob",
                'BN2009',
                'BBG2008', 'SBA.m2.ha', 'spp','pr.spru.ba', 'QMD.cm',
                per.vol.harv = 0.83
                )
dead <- recover.last.measurement(res$dead)
str(dead)
removed <- recover.last.measurement(res$removed)
str(removed)



