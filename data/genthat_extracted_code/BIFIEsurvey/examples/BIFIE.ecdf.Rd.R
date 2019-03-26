library(BIFIEsurvey)


### Name: BIFIE.ecdf
### Title: Empirical Distribution Function and Quantiles
### Aliases: BIFIE.ecdf summary.BIFIE.ecdf
### Keywords: Empirical distribution function Quantiles summary

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

# ecdf
vars <- c( "ASMMAT", "books")
group <- "female" ; group_values <- 0:1
# quantile type 1
res1 <- BIFIEsurvey::BIFIE.ecdf( bifieobj,  vars=vars, group=group )
summary(res1)
res2 <- BIFIEsurvey::BIFIE.ecdf( bifieobj,  vars=vars, group=group, quanttype=2)
# plot distribution function
ecdf1 <- res1$ecdf
plot( ecdf1$ASMMAT_female0, ecdf1$yval, type="l")
plot( res2$ecdf$ASMMAT_female0, ecdf1$yval, type="l", lty=2)
plot( ecdf1$books_female0, ecdf1$yval, type="l", col="blue")



