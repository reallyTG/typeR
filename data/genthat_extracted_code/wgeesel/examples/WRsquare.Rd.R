library(wgeesel)


### Name: WRsquare.gee
### Title: Weighted R Square for WGEE
### Aliases: WRsquare.gee
### Keywords: wgee MAR

### ** Examples

data(imps)

fit <- wgee(Y ~ Drug+Sex+Time, data=imps, id=imps$ID, family="binomial",
            corstr="exchangeable",scale=NULL,mismodel= R ~ Drug+Time)
WRsquare.gee(fit, weight_mean=TRUE)



