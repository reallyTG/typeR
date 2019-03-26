library(BiProbitPartial)


### Name: BiProbitPartial
### Title: Bivariate probit with partial observability
### Aliases: BiProbitPartial

### ** Examples

data('Mroz87',package = 'sampleSelection')
Mroz87$Z = Mroz87$lfp*(Mroz87$wage >= 5)

f1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
     data = Mroz87, philosophy = "frequentist")
summary(f1)

# Use the estimates from the frequenist philosophy as starting values
b1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
    data = Mroz87, philosophy = "bayesian", 
    control = list(beta = f1$par[1:(length(f1$par)-1)], rho = tail(f1$par,1)))
summary(b1)

## Not run: 
##D #The example used in the package sampleSelection is likely unidentified for 
##D this model
##D f2 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ, 
##D      data = Mroz87, philosophy = "frequentist") #crashes
##D summary(f2) #crashes (f2 non-existent)
##D 
##D # Bayesian methods typically still work for unidentified models
##D b2 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ, 
##D     data = Mroz87, philosophy = "bayesian", 
##D     control = list(beta = f1$par[1:(length(f1$par)-3)], rho = tail(f1$par,1)))
##D summary(b2)   
## End(Not run)




