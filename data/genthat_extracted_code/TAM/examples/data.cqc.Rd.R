library(TAM)


### Name: data.cqc
### Title: More Datasets and Examples (Similar to ConQuest Examples)
### Aliases: data.cqc01 data.cqc02 data.cqc03 data.cqc04 data.cqc05
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D library(sirt)
##D library(WrightMap)
##D # In the following, ConQuest will also be used for estimation.
##D path.conquest <- "C:/Conquest"             # path of the ConQuest console.exe
##D setwd( "p:/my_files/ConQuest_analyses" )  # working directory
##D 
##D #############################################################################
##D # EXAMPLE 01: Rasch model data.cqc01
##D #############################################################################
##D 
##D data(data.cqc01)
##D dat <- data.cqc01
##D 
##D #********************************************
##D #*** Model 01: Estimate Rasch model
##D mod01 <- TAM::tam.mml(dat)
##D summary(mod01)
##D 
##D #------- ConQuest
##D 
##D # estimate model
##D cmod01 <- sirt::R2conquest( dat, name="mod01", path.conquest=path.conquest)
##D summary(cmod01)   # summary output
##D # read shw file with some terms
##D shw01a <- sirt::read.show( "mod01.shw" )
##D cmod01$shw.itemparameter
##D # read person item maps
##D pi01a <- sirt::read.pimap( "mod01.shw" )
##D cmod01$shw.pimap
##D # read plausible values (npv=10 plausible values)
##D pv01a <- sirt::read.pv(pvfile="mod01.pv", npv=10)
##D cmod01$person
##D 
##D # read ConQuest model
##D res01a <- WrightMap::CQmodel(p.est="mod01.wle", show="mod01.shw", p.type="WLE" )
##D print(res01a)
##D # plot item fit
##D WrightMap::fitgraph(res01a)
##D # Wright map
##D plot(res01a, label.items.srt=90 )
##D 
##D #############################################################################
##D # EXAMPLE 02: Partial credit model and rating scale model data.cqc02
##D #############################################################################
##D 
##D data(data.cqc02)
##D dat <- data.cqc02
##D 
##D #********************************************
##D # Model 02a: Partial credit model in ConQuest parametrization 'item+item*step'
##D mod02a <- TAM::tam.mml( dat, irtmodel="PCM2" )
##D summary(mod02a, file="mod02a")
##D fit02a <- TAM::tam.fit(mod02a)
##D summary(fit02a)
##D 
##D #--- ConQuest
##D # estimate model
##D maxK <- max( dat, na.rm=TRUE )
##D cmod02a <- sirt::R2conquest( dat, itemcodes=0:maxK, model="item+item*step",
##D                name="mod02a", path.conquest=path.conquest)
##D summary(cmod02a)   # summary output
##D 
##D # read ConQuest model
##D res02a <- WrightMap::CQmodel(p.est="mod02a.wle", show="mod02a.shw", p.type="WLE" )
##D print(res02a)
##D # Wright map
##D plot(res02a, label.items.srt=90 )
##D plot(res02a, item.table="item")
##D 
##D #********************************************
##D # Model 02b: Rating scale model
##D mod02b <- TAM::tam.mml( dat, irtmodel="RSM" )
##D summary( mod02b )
##D 
##D #############################################################################
##D # EXAMPLE 03: Faceted Rasch model for rating data data.cqc03
##D #############################################################################
##D 
##D data(data.cqc03)
##D # select items
##D resp <- data.cqc03[, c("crit1","crit2") ]
##D 
##D #********************************************
##D # Model 03a: 'item+step+rater'
##D mod03a <- TAM::tam.mml.mfr( resp, facets=data.cqc03[,"rater",drop=FALSE],
##D             formulaA=~ item+step+rater, pid=data.cqc03$pid )
##D summary( mod03a )
##D 
##D #--- ConQuest
##D X <- data.cqc03[,"rater",drop=FALSE]
##D X$rater <- as.numeric(substring( X$rater, 2 )) # convert 'rater' in numeric format
##D maxK <- max( resp, na.rm=TRUE)
##D cmod03a <- sirt::R2conquest( resp,  X=X, regression="",  model="item+step+rater",
##D              name="mod03a", path.conquest=path.conquest, set.constraints="cases" )
##D summary(cmod03a)   # summary output
##D 
##D # read ConQuest model
##D res03a <- WrightMap::CQmodel(p.est="mod03a.wle", show="mod03a.shw", p.type="WLE" )
##D print(res03a)
##D # Wright map
##D plot(res03a)
##D 
##D #********************************************
##D # Model 03b: 'item:step+rater'
##D mod03b <- TAM::tam.mml.mfr( resp, facets=data.cqc03[,"rater",drop=FALSE],
##D             formulaA=~ item + item:step+rater, pid=data.cqc03$pid )
##D summary( mod03b )
##D 
##D #********************************************
##D # Model 03c: 'step+rater' for first item 'crit1'
##D # Restructuring the data is necessary.
##D # Define raters as items in the new dataset 'dat1'.
##D persons <- unique( data.cqc03$pid )
##D raters <- unique( data.cqc03$rater )
##D dat1 <- matrix( NA, nrow=length(persons), ncol=length(raters) + 1 )
##D dat1 <- as.data.frame(dat1)
##D colnames(dat1) <- c("pid", raters )
##D dat1$pid <- persons
##D for (rr in raters){
##D     dat1.rr <- data.cqc03[ data.cqc03$rater==rr, ]
##D     dat1[ match(dat1.rr$pid, persons),rr] <- dat1.rr$crit1
##D         }
##D   ##   > head(dat1)
##D   ##       pid R11 R12 R13 R14 R15 R16 R17 R18 R19 R20 R21 R22 R23 R24 R25 R26
##D   ##   1 10001   2   2  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
##D   ##   2 10002  NA  NA   2   1  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
##D   ##   3 10003  NA  NA   3   2  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
##D   ##   4 10004  NA  NA   2   1  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
##D   ##   5 10005  NA  NA   1   1  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
##D   ##   6 10006  NA  NA   1   1  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA
##D # estimate model 03c
##D mod03c <- TAM::tam.mml( dat1[,-1], pid=dat1$pid )
##D summary( mod03c )
##D 
##D #############################################################################
##D # EXAMPLE 04: Faceted Rasch model for rating data data.cqc04
##D #############################################################################
##D 
##D data(data.cqc04)
##D resp <- data.cqc04[,4:8]
##D facets <- data.cqc04[, c("rater", "topic") ]
##D 
##D #********************************************
##D # Model 04a: 'item*step+rater+topic'
##D formulaA <- ~ item*step + rater + topic
##D mod04a <- TAM::tam.mml.mfr( resp, facets=facets,
##D             formulaA=formulaA, pid=data.cqc04$pid )
##D summary( mod04a )
##D 
##D #********************************************
##D # Model 04b: 'item*step+rater+topic+item*rater+item*topic'
##D formulaA <- ~ item*step + rater + topic + item*rater + item*topic
##D mod04b <- TAM::tam.mml.mfr( resp, facets=facets,
##D             formulaA=formulaA, pid=data.cqc04$pid )
##D summary( mod04b )
##D 
##D #********************************************
##D # Model 04c: 'item*step' with fixing rater and topic parameters to zero
##D formulaA <- ~ item*step + rater + topic
##D mod04c0 <- TAM::tam.mml.mfr( resp, facets=facets,
##D             formulaA=formulaA, pid=data.cqc04$pid, control=list(maxiter=4) )
##D summary( mod04c0 )
##D # fix rater and topic parameter to zero
##D xsi.est <- mod04c0$xsi
##D xsi.fixed <- cbind( seq(1,nrow(xsi.est)), xsi.est$xsi )
##D rownames(xsi.fixed) <- rownames(xsi.est)
##D xsi.fixed <- xsi.fixed[ c(8:13),]
##D xsi.fixed[,2] <- 0
##D   ##   > xsi.fixed
##D   ##             [,1] [,2]
##D   ##   raterAM      8    0
##D   ##   raterBE      9    0
##D   ##   raterCO     10    0
##D   ##   topicFami   11    0
##D   ##   topicScho   12    0
##D   ##   topicSpor   13    0
##D mod04c1 <- TAM::tam.mml.mfr( resp, facets=facets,
##D              formulaA=formulaA, pid=data.cqc04$pid, xsi.fixed=xsi.fixed )
##D summary( mod04c1 )
##D 
##D #############################################################################
##D # EXAMPLE 05: Partial credit model with latent regression and
##D #             plausible value imputation
##D #############################################################################
##D 
##D data(data.cqc05)
##D resp <- data.cqc05[, -c(1:3) ] # select item responses
##D 
##D #********************************************
##D # Model 05a: Partial credit model
##D mod05a <-tam.mml(resp=resp, irtmodel="PCM2" )
##D 
##D #********************************************
##D # Model 05b: Partial credit model with latent regressors
##D mod05b <-tam.mml(resp=resp, irtmodel="PCM2",  Y=data.cqc05[,1:3] )
##D # Plausible value imputation
##D pvmod05b <- TAM::tam.pv( mod05b )
## End(Not run)



