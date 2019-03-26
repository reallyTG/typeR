library(EValue)


### Name: sens_table
### Title: Tables for sensitivity analyses
### Aliases: sens_table
### Keywords: confounding, meta-analysis, sensitivity

### ** Examples

sens_table( meas="prop", q=log(1.1), muB=c( log(1.1),
log(1.5), log(2.0) ), sigB=c(0, 0.1, 0.2), 
yr=log(2.5), t2=0.1 )

sens_table( meas="Tmin", q=c( log(1.1), log(1.5) ),
yr=log(1.3), t2=0.1 ) 

# Tmin is 1 here because we already have <80% of effects
#  below log(1.1) even without any confounding
sens_table( meas="Gmin", r=0.8, q=c( log(1.1) ),
yr=log(1.3), t2=0.1 )



