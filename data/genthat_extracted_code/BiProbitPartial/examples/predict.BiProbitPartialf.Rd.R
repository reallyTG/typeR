library(BiProbitPartial)


### Name: predict.BiProbitPartialf
### Title: predict method for class 'BiProbitPartialf'
### Aliases: predict.BiProbitPartialf

### ** Examples

##
# Perform a prediction with the same covariates the model is estimated with
##

data('Mroz87',package = 'sampleSelection')
Mroz87$Z = Mroz87$lfp*(Mroz87$wage >= 5)

f1 = BiProbitPartial(Z ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city, 
     data = Mroz87, philosophy = "frequentist")

library(Formula)
eqn = Formula::Formula( ~ educ + age + kids5 + kids618 + nwifeinc | educ + exper + city)
matrix1 = model.matrix(eqn, lhs = 0, rhs=1, data= Mroz87)
matrix2 = model.matrix(eqn, lhs = 0, rhs=2, data= Mroz87)
newdat = cbind(matrix1,matrix2) 
preds1 = predict(f1,newdat)
head(preds1)
preds2 = predict(f1,newdat, jRule = .25)

# Compare predicted outcome with realized outcome
head(cbind(Mroz87$Z,preds1$ZHat,preds2$ZHat),20)




