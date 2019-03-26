library(BiProbitPartial)


### Name: summary.optimrml
### Title: Summary method for class 'optimrml'
### Aliases: summary.optimrml

### ** Examples

data('Mroz87',package = 'sampleSelection')
Mroz87$Z = Mroz87$lfp*(Mroz87$wage >= 5)

f1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
     data = Mroz87, philosophy = "frequentist")
summary(f1)

b1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
    data = Mroz87, philosophy = "bayesian", 
    control = list(beta = f1$par[1:(length(f1$par)-1)], rho = tail(f1$par,1)))
summary(b1)




