library(cmm)


### Name: JoinModels
### Title: JoinModels
### Aliases: JoinModels
### Keywords: univar

### ** Examples

# simultaneously specify marginal independence in two marginal tables

bt1 = ConstraintMatrix(c("A","B"),list(c("A"),c("B")),c(3,3))
at1 = MarginalMatrix(c("A","B","C"),c("A","B"),c(3,3,3))
model1 = list(bt1,"log",at1)

bt2 = ConstraintMatrix(c("B","C"),list(c("B"),c("C")),c(3,3))
at2 = MarginalMatrix(c("A","B","C"),c("B","C"),c(3,3,3))
model2 = list(bt2,"log",at2)

model12 = JoinModels(model1,model2)

# the model can be fitted to an artificial data set
n = c(1:27)
fit=MarginalModelFit(n,model12)



