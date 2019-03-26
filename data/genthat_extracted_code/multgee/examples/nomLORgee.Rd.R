library(multgee)


### Name: nomLORgee
### Title: Marginal Models For Correlated Nominal Multinomial Responses
### Aliases: nomLORgee

### ** Examples

## See the interpretation in Touloumis (2011).
data(housing)
fitmod <- nomLORgee(y~factor(time)*sec,data=housing,id=id, repeated=time)
summary(fitmod) 



