library(tsDyn)


### Name: aar
### Title: Additive nonlinear autoregressive model
### Aliases: AAR aar summary.aar print.aar plot.aar
### Keywords: ts

### ** Examples

#fit an AAR model:
mod <- aar(log(lynx), m=3)
#Summary informations:
summary(mod)
#Diagnostic plots:
plot(mod)



