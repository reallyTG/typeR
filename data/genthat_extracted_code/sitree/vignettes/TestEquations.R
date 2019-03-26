## ------------------------------------------------------------------------
## Always bare in mind that RF trList and trListDead are modified in place
## Do not copy 

Polygon <- setRefClass("Polygon", fields = c("sides"))
square <- Polygon$new(sides = 4)

la <- function(a){    
    triangle <- square
    triangle$sides <- 3
    return(a+2)
}

square$sides
la(2)

square$sides

## but if we do
square <- Polygon$new(sides = 4)

la <- function(a){    
    triangle <- square$copy()
    triangle$sides <- 3
    return(a+2)
}

square$sides
la(2)
## the object remains unchanged
square$sides

## ------------------------------------------------------------------------

 require(sitree)
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
                     fn.modif      = NULL, 
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
 

 ## getTrees(i, j)  -- obtains the information of the i trees, on the j periods,
 ## by default it selects all. It does not display it, it passes the value.
 ## It returns a list with elements plot.id, treeid, dbh.mm, height.dm, yrs.sim,
 ## tree.sp
 
 get.some.trees <- res$live$getTrees(1:3, 2:5)

 ## extractTrees(i)  -- extracts the i trees, it removed the trees from the
 ## original object and it passes the information. It returns a list.

 dead <- res$live$extractTrees(4:7)

 ## addTrees(x) -- x should be a list
 
 res$live$addTrees(dead)

 ## last.time.alive. It checks when was the last DBH measured.
 new.dead.trees <- trListDead$new(
      data = dead,
      last.measurement = cbind(
        do.call("dead.trees.growth"
              , args = list(
                  dt     = dead,
                  growth = data.frame(dbh.inc.mm     = rep(3, 4),
                                      hgt.inc.dm  = rep(8, 4)),
                  mort   = rep(TRUE, 4),
                  this.period = "t2")
                ),
        found.dead = "t3"
      ),
      nperiods = res$live$nperiods
      )
 
 lta <- new.dead.trees$last.time.alive()
 
 ## which in this case differs from the data stored under the last.measurement
 ## field because we have defined it artificially above as "t3"
 lta
 new.dead.trees$last.measurement$found.dead
 ## But we can remove the data from the periods after it was found dead
 new.dead.trees$remove.next.period("t3")
 new.dead.trees$remove.next.period("t4")
 new.dead.trees$remove.next.period("t5")
 ## and now results do match
 lta <- new.dead.trees$last.time.alive()
 ## last time it was alive was in "t2"
 lta
 ## ant it was found dead in "t3"
 new.dead.trees$last.measurement$found.dead
 



## ------------------------------------------------------------------------
 
set.seed(2017)
n.periods <- 50
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
                    fn.modif      = NULL,
                    fn.prep.common.vars = 'prep.common.vars.fun'
                ),
                n.periods = n.periods,
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




## ------------------------------------------------------------------------
require(lattice)

dbh.mm <- res$live$data$dbh.mm
dbh.mm.short <- reshape(dbh.mm, 
                        varying = paste0("t", 0:n.periods), 
                        timevar = "period",
                        direction = "long", sep = "")
head(dbh.mm.short)
dbh.mm.short$t[dbh.mm.short$t == 0] <- NA
histogram( ~ t | period, data = dbh.mm.short, plot.points = FALSE,
          ref = TRUE, auto.key = list(space = "right"), xmin = 50,
          xlab = "dbh.mm")

## ------------------------------------------------------------------------
vol <- data.frame(matrix(NA, ncol = n.periods+1, nrow = length(res$plot.data$plot.id)))
names(vol) <- paste0("t", 0:n.periods)
for (i.period in 0:n.periods){
    sa <- prep.common.vars.fun (
        tr = res$live, fl= res$plot.data,
        i.period, this.period = paste0("t", i.period),
        common.vars = NULL, vars.required = "vuprha.m3.ha", 
        period.length = 5 )
    
    vol[, (i.period +1)] <- sa$res$vuprha.m3.ha 
    ## This is volume per ha, if we prefer just m3 we multiply by ha2total
    ## ha2total is the number of ha represented by the plot
    vol[, (i.period +1)] <- vol[, (i.period +1)] * sa$fl$ha2total
}
vol.m3.short <- reshape(vol, 
                        varying = paste0("t", 0:n.periods),
                        timevar = "period",
                        direction = "long",
                    sep = "")
vol.m3.short$t[vol.m3.short$t == 0] <- NA
harv.total <- aggregate(t ~ period, data = vol.m3.short, FUN = sum)
xyplot( t/1e6 ~ period, data = harv.total, type = 'l',
                        ylab = "standing volume in mill. m3")

## ------------------------------------------------------------------------
vol <- data.frame(matrix(NA, ncol = n.periods + 1,
                         nrow = length(res$plot.data$plot.id)))
## res$removed$data only contains the "history of the tree", but we need
## the dbh and height of the tree at harvest time
names(vol) <- paste0("t", 0:n.periods)
removed <- recover.last.measurement(res$removed)

for (i.period in 0:n.periods){
    sa <- prep.common.vars.fun (
        tr = res$removed,
        fl = res$plot.data,
        i.period,
        this.period = paste0("t", i.period),
        common.vars = NULL,
        vars.required = "vuprha.m3.ha", 
        period.length = 5 )
    
    vol[, (i.period +1)] <- sa$res$vuprha.m3.ha 
    ## This is volume per ha, if we prefer just m3.
    vol[, (i.period +1)] <- vol[, (i.period +1)] * sa$fl$ha2total
}
names(vol) <- paste0(substr(names(vol), 1, 1), ".", substr(names(vol), 2, 3))

vol.m3.short <- reshape(vol, 
                        varying = paste0("t.", 0:n.periods),
                        timevar = "period",
                        idvar = "id",
                        direction = "long"
                        )
vol.m3.short$t[vol.m3.short$t == 0] <- NA
harv.total <- aggregate(t ~ period, data = vol.m3.short, FUN = sum)
xyplot( t/1e6 ~ period, data = harv.total, type = 'l',
       ylab = "harvested volume in mill. m3")

## ------------------------------------------------------------------------
vol <- data.frame(matrix(NA, ncol = n.periods + 1,
                         nrow = length(res$plot.data$plot.id)))
names(vol) <- paste0("t", 0:n.periods)
dead <- recover.last.measurement(res$dead)

for (i.period in 0:n.periods){
    sa <- prep.common.vars.fun (
        tr = res$dead, fl= res$plot.data,
        i.period, this.period = paste0("t", i.period),
        common.vars = NULL, vars.required = "vuprha.m3.ha", 
        period.length = 5 )
    
    vol[, (i.period +1)] <- sa$res$vuprha.m3.ha 
    ## This is volume per ha, if we prefer just m3.
    vol[, (i.period +1)] <- vol[, (i.period +1)] * sa$fl$ha2total
}

names(vol) <- paste0(substr(names(vol), 1, 1), ".", substr(names(vol), 2, 3))
vol.m3.short <- reshape(vol, 
                        varying = paste0("t.", 0:n.periods),
                        timevar = "period",
                        idvar = "id",
                        direction = "long"
                        )
head(vol.m3.short)

vol.m3.short$t[vol.m3.short$t == 0] <- NA
harv.total <- aggregate(t ~ period, data = vol.m3.short, FUN = sum)
xyplot( t/1e6 ~ period, data = harv.total, type = 'l',
       ylab = "volume of dead trees in mill. m3")

## ------------------------------------------------------------------------
age <- res$plot.data$stand.age.years
age.short<- reshape(age, 
                    varying = paste0("t", 0:n.periods), 
                    timevar = "period",
                    idvar = "id",                    
                    direction = "long",
                    sep = ""
                    )
head(age.short)
histogram( ~ t | period, data = age.short, plot.points = FALSE,
          ref = TRUE, auto.key = list(space = "right"), xmin = 50,
          xlab = "stand age (in years)")

## ------------------------------------------------------------------------
ET2001 <- function (tr, fl, common.vars, this.period, ...) 
{
    if (!all(unique(common.vars$spp) %in% c("spruce", "pine", 
                                            "birch", "other"))) {
        message("spp should only contain values spruce, pine, birch, other")
    }
    dbh.mm <- tr$data[["dbh.mm"]][, this.period]
    p.functions <-
        data.frame(a0 = c( 8.059,   8.4904, 4.892,  5.157),
                   b1 = c(-6.702, -14.266, -2.528, -7.3544),
                   b2 = c(-0.028,  -0.0462, 0,     -0.0199),
                   b3 = c(-0.0264, -0.0761, 0,     0 ),
                   b4 = c(-0.0132, -0.0761, 0,     0 )
                   )
    rownames(p.functions) <- c("spruce", "pine", "birch", "other")
  
    logit <- p.functions[common.vars$spp, "a0"] +
        p.functions[common.vars$spp, "b1"] * (dbh.mm/10)^(-1) +
        p.functions[common.vars$spp, "b2"] * common.vars$PBAL.m2.ha +
        p.functions[common.vars$spp, "b3"] * fl$SI.m[common.vars$i.stand] + 
        p.functions[common.vars$spp, "b4"] * common.vars$pr.spp.ba$spru
    mort.B <- 1- (1/(1 + exp(-logit)))
    mort <- ifelse(mort.B >= runif(length(tr$data[["plot.id"]]), 
                                   0, 1), TRUE, FALSE)
    return(mort)
}

## ----eval = FALSE--------------------------------------------------------
#  set.seed(2017)
#  n.periods <- 10
#  i.max <- 50
#  vol.1 <- data.frame(matrix(NA, ncol = n.periods, nrow = i.max))
#  names(vol.1) <- paste0("t", 0:n.periods)
#  
#  for (i in (1:i.max)){
#      print(i)
#      res1 <- sitree (tree.df   = tr,
#                       stand.df  = fl,
#                       functions = list(
#                           fn.growth     = 'grow.dbhinc.hgtinc',
#                           fn.dbh.inc = "dbhi.BN2009",
#                           fn.hgt.inc =  "height.korf",
#                           fn.mort       = 'mort.B2007',
#                           fn.recr       = 'recr.BBG2008',
#                           fn.management = 'management.prob',
#                           fn.tree.removal = 'mng.tree.removal',
#                           fn.modif      = NULL,
#                           fn.prep.common.vars = 'prep.common.vars.fun'
#                       ),
#                       n.periods = n.periods,
#                       period.length = 5,
#                       mng.options = NA,
#                       print.comments = FALSE,
#                       species.spruce = c(1, 2, 3),
#                       species.pine = c(10, 11, 20, 21, 29),
#                       species.harw = c(30, 31),
#                       fun.final.felling = "harv.prob",
#                       fun.thinning      = "thin.prob",
#                       'BN2009',
#                       'BBG2008', 'SBA.m2.ha', 'spp','pr.spru.ba', 'QMD.cm',
#                       per.vol.harv = 0.83
#                       )
#  
#      for (i.period in 0:n.periods){
#          sa <- prep.common.vars.fun (
#              tr = res1$live, fl= res1$plot.data,
#              i.period, this.period = paste0("t", i.period),
#              common.vars = NULL, vars.required = "vuprha.m3.ha",
#              period.length = 5 )
#  
#          vol.1[i, (i.period +1)] <- sum(sa$res$vuprha.m3.ha * sa$fl$ha2total )
#  
#      }
#  }

## ----eval = FALSE--------------------------------------------------------
#  
#  vol.2 <- data.frame(matrix(NA, ncol = n.periods, nrow = i.max))
#  names(vol.2) <- paste0("t", 0:n.periods)
#  
#  for (i in (1:i.max)){
#      print(i)
#  
#      res2 <- sitree (tree.df   = tr,
#                       stand.df  = fl,
#                       functions = list(
#                           fn.growth     = 'grow.dbhinc.hgtinc',
#                           fn.dbh.inc = "dbhi.BN2009",
#                           fn.hgt.inc =  "height.korf",
#                           fn.mort       = 'ET2001',
#                           fn.recr       = 'recr.BBG2008',
#                           fn.management = 'management.prob',
#                           fn.tree.removal = 'mng.tree.removal',
#                           fn.modif      = NULL,
#                           fn.prep.common.vars = 'prep.common.vars.fun'
#                       ),
#                       n.periods = n.periods,
#                       period.length = 5,
#                       mng.options = NA,
#                       print.comments = FALSE,
#                       species.spruce = c(1, 2, 3),
#                       species.pine = c(10, 11, 20, 21, 29),
#                       species.harw = c(30, 31),
#                       fun.final.felling = "harv.prob",
#                       fun.thinning      = "thin.prob",
#                       'BN2009','PBAL.m2.ha',
#                       'BBG2008', 'SBA.m2.ha', 'spp','pr.spru.ba', 'QMD.cm',
#                       per.vol.harv = 0.83
#                       )
#  
#      for (i.period in 0:n.periods){
#          sa <- prep.common.vars.fun (
#              tr = res1$live, fl= res1$plot.data,
#              i.period, this.period = paste0("t", i.period),
#              common.vars = NULL, vars.required = "vuprha.m3.ha",
#              period.length = 5 )
#  
#          vol.2[i, (i.period +1)] <- sum(sa$res$vuprha.m3.ha * sa$fl$ha2total )
#  
#      }
#  }
#  ## During the five periods, there is actually not that much of a difference
#  colMeans(vol.1)/1e6
#  colMeans(vol.2)/1e6
#  
#  

