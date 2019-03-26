library(TAM)


### Name: tam.ctt
### Title: Classical Test Theory Based Statistics and Plots
### Aliases: tam.ctt tam.ctt2 tam.ctt3 plotctt
### Keywords: Classical test theory statistics plot

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Multiple choice data data.mc
##D #############################################################################
##D 
##D data(data.mc)
##D # estimate Rasch model for scored data.mc data
##D mod <- TAM::tam.mml( resp=data.mc$scored )
##D # estimate WLE
##D w1 <- TAM::tam.wle( mod )
##D # estimate plausible values
##D set.seed(789)
##D p1 <- TAM::tam.pv( mod, ntheta=500, normal.approx=TRUE )$pv
##D 
##D # CTT results for raw data
##D stat1 <- TAM::tam.ctt( resp=data.mc$raw, wlescore=w1$theta, pvscores=p1[,-1] )
##D stat1a <- TAM::tam.ctt2( resp=data.mc$raw, wlescore=w1$theta )  # faster
##D stat1b <- TAM::tam.ctt2( resp=data.mc$raw )  # only frequencies
##D stat1c <- TAM::tam.ctt3( resp=data.mc$raw, wlescore=w1$theta )  # faster
##D 
##D # plot empirical item response curves
##D plotctt( resp=data.mc$raw, theta=w1$theta, Ncuts=5, ask=TRUE)
##D # use graphics for plot
##D plotctt( resp=data.mc$raw, theta=w1$theta, Ncuts=5, ask=TRUE, package="graphics")
##D # change colors
##D col.list <- c( "darkred",  "darkslateblue", "springgreen4", "darkorange",
##D                 "hotpink4", "navy" )
##D plotctt( resp=data.mc$raw, theta=w1$theta, Ncuts=5, ask=TRUE,
##D         package="graphics", col.list=col.list )
##D 
##D # CTT results for scored data
##D stat2 <- TAM::tam.ctt( resp=data.mc$scored, wlescore=w1$theta, pvscores=p1[,-1] )
##D 
##D # descriptive statistics for different groups
##D # define group identifier
##D group <- c( rep(1,70), rep(2,73) )
##D stat3 <- TAM::tam.ctt( resp=data.mc$raw, wlescore=w1$theta, pvscores=p1[,-1], group=group)
##D stat3a <- TAM::tam.ctt2( resp=data.mc$raw, wlescore=w1$theta,  group=group)
## End(Not run)



