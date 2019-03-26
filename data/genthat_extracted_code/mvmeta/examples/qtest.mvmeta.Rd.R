library(mvmeta)


### Name: qtest.mvmeta
### Title: Cochran Q Test of Heterogeneity for mvmeta Models
### Aliases: qtest.mvmeta print.qtest.mvmeta
### Keywords: models regression multivariate methods htest

### ** Examples

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL)~1,S=berkey98[5:7],data=berkey98)

# MULTIVARIATE COCHRAN Q TEST FOR HETEROGENEITY
test <- qtest(model)
print(test,digits=2)
unclass(test)



