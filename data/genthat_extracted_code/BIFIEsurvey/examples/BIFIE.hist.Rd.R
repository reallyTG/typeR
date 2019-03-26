library(BIFIEsurvey)


### Name: BIFIE.hist
### Title: Histogram
### Aliases: BIFIE.hist summary.BIFIE.hist plot.BIFIE.hist
### Keywords: Histogram summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

# histogram
res1 <- BIFIEsurvey::BIFIE.hist( bifieobj, vars="ASMMAT", group="female" )
# plot histogram for first group (female=0)
plot( res1$histobj$ASMMAT_female0, col="lightblue")
# plot both histograms after each other
plot( res1 )

# user-defined vector of breaks
res2 <- BIFIEsurvey::BIFIE.hist( bifieobj, vars="ASMMAT",
              breaks=seq(0,900,10), group="female" )
plot( res2, col="orange")



