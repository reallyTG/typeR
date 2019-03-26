library(discSurv)


### Name: dataLongCompRisks
### Title: Data Long Competing Risks Transformation
### Aliases: dataLongCompRisks
### Keywords: datagen

### ** Examples

# Example with unemployment data
library(Ecdat)
data(UnempDur)

# Select subsample
SubUnempDur <- UnempDur [1:100, ]

# Convert competing risk data to long format
SubUnempDurLong <- dataLongCompRisks (dataSet=SubUnempDur, timeColumn="spell", 
eventColumns=c("censor1", "censor2", "censor3", "censor4"))
head(SubUnempDurLong, 20)

# Fit multinomial logit model with VGAM package
# with one coefficient per response
library(VGAM)
multLogitVGM <- vgam(cbind(e0, e1, e2, e3, e4) ~ timeInt + ui + age + logwage,
                    family=multinomial(refLevel=1), 
                    data = SubUnempDurLong)
coef(multLogitVGM)

# Alternative: Use nnet
# Convert response to factor
rawResponseMat <- SubUnempDurLong[, c("e0", "e1", "e2", "e3", "e4")]
NewFactor <- factor(unname(apply(rawResponseMat, 1, function(x) which(x == 1))), 
                    labels = colnames(rawResponseMat))

# Include recoded response in data
SubUnempDurLong <- cbind(SubUnempDurLong, NewResp=NewFactor)

# Construct formula of mlogit model
mlogitFormula <- formula(NewResp ~ timeInt + ui + age + logwage)

# Fit multinomial logit model
# with one coefficient per response
library(nnet)
multLogitNNET <- multinom(formula=mlogitFormula, data=SubUnempDurLong)
coef(multLogitNNET)




