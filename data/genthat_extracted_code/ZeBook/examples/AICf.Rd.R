library(ZeBook)


### Name: AICf
### Title: Calculate AIC, Akaike's Information Criterion
### Aliases: AICf

### ** Examples

x=c(1,2,3,4,5)
y=c(1.2,1.8,3.5,4.3,5.5)
fit = lm(y~x)
AIC(fit)
AICf(y,predict(fit),3) # 3 parameters : intercept, slope and variance



