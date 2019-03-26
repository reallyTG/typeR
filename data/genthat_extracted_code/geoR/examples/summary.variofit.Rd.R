library(geoR)


### Name: summary.variofit
### Title: Summarize Results of Variogram Estimation
### Aliases: summary.variofit print.summary.variofit print.variofit
### Keywords: spatial

### ** Examples

s100.vario <- variog(s100, max.dist=1)
wls <- variofit(s100.vario, ini=c(.5, .5), fix.nugget = TRUE)
wls
summary(wls)



