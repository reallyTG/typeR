library(gamlss.nl)


### Name: nlgamlss
### Title: Fitting non linear Generalized Additive Models for Location
###   Scale and Shape (GAMLSS)
### Aliases: nlgamlss
### Keywords: regression

### ** Examples

data(la)
# fitting a BCPE distribtion to the data
modBCPE<- nlgamlss(y=PET60, mu.fo=~bflow*(1-(1-exp(p1))*exp(-p2/bflow)),
                   sigma.formula=~1,  mu.start = c(-.9, 90), 
                   sigma.start= -2.3, nu.start=0, tau.start=log(2.5),  
                   family=BCPE, data=la)
modBCPE
plot(modBCPE)



