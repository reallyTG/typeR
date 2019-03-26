library(augSIMEX)


### Name: augSIMEX
### Title: Analysis of Data with Mixed Measurement Error and
###   Misclassification in Covariates
### Aliases: augSIMEX
### Keywords: funtion core

### ** Examples

### Example 1: Univariate Case
data(ToyUni)
example1<-augSIMEX(mainformula = Y ~ Xstar + Zstar + W, family = binomial(link = logit),
  mismodel = pi|qi ~ W, 
  meformula = Xstar ~ X + Z + W,
  data = ToyUni$Main,validationdata = ToyUni$Validation, subset = NULL,
  err.var = "Xstar", mis.var = "Zstar", err.true = "X", mis.true = "Z", 
  err.mat = NULL,
  lambda = NULL, M = 5, B = 2, nBoot = 2, extrapolation="quadratic")                   
summary(example1)

## Without adjustment
example1_naive <- glm(formula = Y ~ Xstar + Zstar + W,
family = binomial(link = logit),data = ToyUni$Main)
summary(example1_naive)

## using  accurate data
example1_true <- glm(Y~Xstar+Zstar+W, family = binomial(link=logit), 
   data=ToyUni$True)


### Example 2: Multivariate Case
data(ToyMult)
ErrorFormula<-Xstar.X1|Xstar.X2~-1+X.X1|-1+X.X2   ## measurement error model
example2<-augSIMEX(mainformula = Y~Xstar.X1+Xstar.X2+Zstar+W.W1+W.W2, 
  mismodel=pi|qi~X.X1+X.X2+W.W1+W.W2, family = binomial,
  data=ToyMult$Main,meformula=ErrorFormula,
  validationdata=ToyMult$Validation, subset=NULL,
  err.var=c("Xstar.X1","Xstar.X2"), mis.var="Zstar", err.true=c("X.X1","X.X2"), 
  mis.true="Z", err.mat = NULL,
  lambda=NULL, M=5, B=2, nBoot=2, extrapolation="quadratic")
summary(example2)


### Example 3
data(ToyRepeat)
example3<-augSIMEX(mainformula = Y~Xstar1+Zstar+W, family = binomial(link=logit),
  mismodel = pi|qi ~ W, meformula = Xstar ~ X + Z + W,
  data=ToyRepeat$Main,validationdata=ToyRepeat$Validation, 
  subset=NULL, err.var="Xstar1", mis.var="Zstar", err.true="X", mis.true="Z", 
  err.mat = NULL, repeated = TRUE,repind=list(Xstar1=c("Xstar1","Xstar2")),
  lambda=NULL, M=5, B=2, nBoot=2, extrapolation="quadratic")
summary(example3)



