library(TAM)


### Name: IRT.WrightMap
### Title: Wright Map for Item Response Models by Using the 'WrightMap'
###   Package
### Aliases: IRT.WrightMap.tam.mml IRT.WrightMap.tamaan
### Keywords: Wright map

### ** Examples

## Not run: 
##D library(WrightMap)
##D 
##D #############################################################################
##D # EXAMPLE 1: Unidimensional models dichotomous data
##D #############################################################################
##D 
##D data(data.sim.rasch)
##D str(data.sim.rasch)
##D dat <- data.sim.rasch
##D 
##D # fit Rasch model
##D mod1 <- TAM::tam.mml(resp=dat)
##D # Wright map
##D IRT.WrightMap( mod1 )
##D # some customized plots
##D IRT.WrightMap( mod1, show.thr.lab=FALSE, label.items=c(1:40), label.items.rows=3)
##D 
##D IRT.WrightMap( mod1,  show.thr.sym=FALSE, thr.lab.text=paste0("I",1:ncol(dat)),
##D      label.items="", label.items.ticks=FALSE)
##D 
##D #--- direct specification with wrightMap function
##D theta <- TAM::tam.wle(mod1)$theta
##D thr <- TAM::tam.threshold(mod1)
##D 
##D # default wrightMap plots
##D WrightMap::wrightMap( theta, thr, label.items.srt=90)
##D WrightMap::wrightMap( theta, t(thr), label.items=c("items") )
##D 
##D # stack all items below each other
##D thr.lab.text <- matrix( "", 1, ncol(dat) )
##D thr.lab.text[1,] <- colnames(dat)
##D WrightMap::wrightMap( theta, t(thr), label.items=c("items"),
##D        thr.lab.text=thr.lab.text, show.thr.sym=FALSE )
##D 
##D #############################################################################
##D # EXAMPLE 2: Unidimensional model polytomous data
##D #############################################################################
##D 
##D data( data.Students, package="CDM")
##D dat <- data.Students
##D 
##D # fit generalized partial credit model using the tamaan function
##D tammodel <- "
##D LAVAAN MODEL:
##D   SC=~ sc1__sc4
##D   SC ~~ 1*SC
##D     "
##D mod1 <- TAM::tamaan( tammodel, dat )
##D # create item level colors
##D library(RColorBrewer)
##D ncat <- 3               # number of category parameters
##D I <- ncol(mod1$resp)    # number of items
##D itemlevelcolors <- matrix(rep( RColorBrewer::brewer.pal(ncat, "Set1"), I),
##D         byrow=TRUE, ncol=ncat)
##D # Wright map
##D IRT.WrightMap(mod1, prob.lvl=.625, thr.sym.col.fg=itemlevelcolors,
##D      thr.sym.col.bg=itemlevelcolors, label.items=colnames( mod1$resp) )
##D 
##D #############################################################################
##D # EXAMPLE 3: Multidimensional item response model
##D #############################################################################
##D 
##D data( data.read, package="sirt")
##D dat <- data.read
##D 
##D # fit three-dimensional Rasch model
##D Q <- matrix( 0, nrow=12, ncol=3 )
##D Q[1:4,1] <- Q[5:8,2] <- Q[9:12,3] <- 1
##D mod1 <- TAM::tam.mml( dat, Q=Q, control=list(maxiter=20, snodes=1000)  )
##D summary(mod1)
##D # define matrix with colors for thresholds
##D c1 <- matrix( c( rep(1,4), rep(2,4), rep(4,4)), ncol=1 )
##D # create Wright map using WLE
##D IRT.WrightMap( mod1, prob.lvl=.65, type="WLE", thr.lab.col=c1, thr.sym.col.fg=c1,
##D         thr.sym.col.bg=c1, label.items=colnames(dat) )
##D # Wright map using PV (the default)
##D IRT.WrightMap( mod1, prob.lvl=.65, type="PV" )
##D # Wright map using population distribution
##D IRT.WrightMap( mod1, prob.lvl=.65, type="Pop" )
##D 
##D #############################################################################
##D # EXAMPLE 4: Wright map for a multi-faceted Rasch model
##D #############################################################################
##D 
##D # This example is copied from
##D # http://wrightmap.org/post/107431190622/wrightmap-multifaceted-models
##D 
##D library(WrightMap)
##D data(data.ex10)
##D dat <- data.ex10
##D 
##D #--- fit multi-faceted Rasch model
##D facets <- dat[, "rater", drop=FALSE]  # define facet (rater)
##D pid <- dat$pid  # define person identifier (a person occurs multiple times)
##D resp <- dat[, -c(1:2)]  # item response data
##D formulaA <- ~item * rater  # formula
##D mod <- TAM::tam.mml.mfr(resp=resp, facets=facets, formulaA=formulaA, pid=dat$pid)
##D 
##D # person parameters
##D persons.mod <- TAM::tam.wle(mod)
##D theta <- persons.mod$theta
##D # thresholds
##D thr <- TAM::tam.threshold(mod)
##D item.labs <- c("I0001", "I0002", "I0003", "I0004", "I0005")
##D rater.labs <- c("rater1", "rater2", "rater3")
##D 
##D #--- Plot 1: Item specific
##D thr1 <- matrix(thr, nrow=5, byrow=TRUE)
##D WrightMap::wrightMap(theta, thr1, label.items=item.labs,
##D    thr.lab.text=rep(rater.labs, each=5))
##D 
##D #--- Plot 2: Rater specific
##D thr2 <- matrix(thr, nrow=3)
##D WrightMap::wrightMap(theta, thr2, label.items=rater.labs,
##D    thr.lab.text=rep(item.labs,  each=3), axis.items="Raters")
##D 
##D #--- Plot 3a: item, rater and item*rater parameters
##D pars <- mod$xsi.facets$xsi
##D facet <- mod$xsi.facets$facet
##D 
##D item.par <- pars[facet=="item"]
##D rater.par <- pars[facet=="rater"]
##D item_rat <- pars[facet=="item:rater"]
##D 
##D len <- length(item_rat)
##D item.long <- c(item.par, rep(NA, len - length(item.par)))
##D rater.long <- c(rater.par, rep(NA, len - length(rater.par)))
##D ir.labs <- mod$xsi.facets$parameter[facet=="item:rater"]
##D 
##D WrightMap::wrightMap(theta, rbind(item.long, rater.long, item_rat),
##D     label.items=c("Items",  "Raters", "Item*Raters"),
##D     thr.lab.text=rbind(item.labs, rater.labs, ir.labs), axis.items="")
##D 
##D #--- Plot 3b: item, rater and item*rater (separated by raters) parameters
##D 
##D # parameters item*rater
##D ir_rater <- matrix(item_rat, nrow=3, byrow=TRUE)
##D # define matrix of thresholds
##D thr <- rbind(item.par, c(rater.par, NA, NA), ir_rater)
##D # matrix with threshold labels
##D thr.lab.text <- rbind(item.labs, rater.labs,
##D            matrix(item.labs, nrow=3, ncol=5, byrow=TRUE))
##D 
##D WrightMap::wrightMap(theta, thresholds=thr,
##D       label.items=c("Items", "Raters", "Item*Raters (R1)",
##D                            "Item*Raters (R2)", "Item*Raters (R3)"),
##D       axis.items="", thr.lab.text=thr.lab.text )
##D 
##D #--- Plot 3c: item, rater and item*rater (separated by items) parameters
##D 
##D # thresholds
##D ir_item <- matrix(item_rat, nrow=5)
##D thr <- rbind(item.par, c(rater.par, NA, NA), cbind(ir_item, NA, NA))
##D # labels
##D label.items <- c("Items", "Raters", "Item*Raters\n (I1)", "Item*Raters \n(I2)",
##D      "Item*Raters \n(I3)", "Item*Raters \n (I4)", "Item*Raters \n(I5)")
##D thr.lab.text <- rbind(item.labs,
##D           matrix(c(rater.labs, NA, NA), nrow=6, ncol=5, byrow=TRUE))
##D 
##D WrightMap::wrightMap(theta, thr,  label.items=label.items,
##D       axis.items="", thr.lab.text=thr.lab.text  )
## End(Not run)



