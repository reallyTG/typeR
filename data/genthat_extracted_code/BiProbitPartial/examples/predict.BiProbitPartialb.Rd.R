library(BiProbitPartial)


### Name: predict.BiProbitPartialb
### Title: predict method for class 'BiProbitPartialb'
### Aliases: predict.BiProbitPartialb

### ** Examples

##
# Perform a prediction with the same covariates the model is estimated with
##

data('Mroz87',package = 'sampleSelection')
Mroz87$Z = Mroz87$lfp*(Mroz87$wage >= 5)

# Run the frequentist version first to get starting values
f1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
    data = Mroz87, philosophy = "frequentist")

b1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
    data = Mroz87, philosophy = "bayesian", 
    control = list(beta = f1$par[1:(length(f1$par)-1)], rho = tail(f1$par,1)))

library(Formula)
eqn = Formula::Formula( ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city)
matrix1 = model.matrix(eqn, lhs = 0, rhs=1, data= Mroz87)
matrix2 = model.matrix(eqn, lhs = 0, rhs=2, data= Mroz87)
newdat = cbind(matrix1,matrix2) 
preds1 = predict(b1,newdat,k1 = dim(matrix1)[2],k2 = dim(matrix2)[2])
head(preds1)
preds2 = predict(b1,newdat,k1 = dim(matrix1)[2],k2 = dim(matrix2)[2], jRule = .25)

# Compare predicted outcome with realized outcome
head(cbind(Mroz87$Z,preds1$ZHat,preds2$ZHat),20)




