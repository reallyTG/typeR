library(multgee)


### Name: ordLORgee
### Title: Marginal Models For Correlated Ordinal Multinomial Responses
### Aliases: ordLORgee

### ** Examples

data(arthritis)
intrinsic.pars(y,arthritis,id,time)
fitmod <- ordLORgee(y~factor(time)+factor(trt)+factor(baseline), data=arthritis,
                    id=id,LORstr="uniform",repeated=time)
summary(fitmod)  



