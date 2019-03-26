library(mitml)


### Name: testConstraints
### Title: Test functions and constraints of model parameters
### Aliases: testConstraints

### ** Examples

data(studentratings)

fml <- MathDis + ReadDis + SchClimate ~ (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# fit simple regression model
fit.lm <- with(implist, lm(SchClimate ~ ReadDis + MathDis))

# apply Rubin's rules
testEstimates(fit.lm)

# * Example 1: test 'identity' function of two parameters
# multi-parameter hypothesis test, equivalent to model comparison

cons <- c("ReadDis","MathDis")
testConstraints(fit.lm, constraints=cons)

# ... adjusting for finite samples
testConstraints(fit.lm, constraints=cons, df.com=749)

# ... using D2
testConstraints(fit.lm, constraints=cons, method="D2")

# * Example 2: test for equality of two effects
# tests the hypothesis that the effects of 'ReadDis' and 'MathDis'
# are equal (ReadDis=MathDis)

cons <- c("ReadDis-MathDis")
testConstraints(fit.lm, constraints=cons)

# * Example 3: test against a fixed value
# tests the hypothesis that the effect of "ReadDis" is one (ReadDis=1)

cons <- c("ReadDis-1")
testConstraints(fit.lm, constraints=cons)

# * Example 4: test 'identity' using arrays and list

fit.lm <- with(implist, lm(SchClimate ~ ReadDis + MathDis))

cons <- c("ReadDis","MathDis")
qhat <- sapply(fit.lm, coef)
uhat <- sapply(fit.lm, function(x) vcov(x), simplify="array")
testConstraints(qhat=qhat, uhat=uhat, constraints=cons)



