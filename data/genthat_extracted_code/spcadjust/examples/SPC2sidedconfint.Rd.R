library(spcadjust)


### Name: SPC2sidedconfint
### Title: Computes a two-sided confidence interval for properties of a
###   control chart.
### Aliases: SPC2sidedconfint

### ** Examples

# Compute 2-sided CI for the ARL of a CUSUM control chart assuming normality.
 X <-  rnorm(100) #observed data
 chart <- new("SPCCUSUM",model=SPCModelNormal(Delta=1)) # CUSUM chart with normal observations
 SPC2sidedconfint(data=X,nrep=100,covprob=0.95,
            property="ARL",chart=chart,params=list(threshold=4))




