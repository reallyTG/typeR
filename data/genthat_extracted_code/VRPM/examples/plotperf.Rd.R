library(VRPM)


### Name: plotperf
### Title: Performance plots for the approximation of an SVM model.
### Aliases: plotperf

### ** Examples

#### Support Vector Machine classifier
library(kernlab)
data(iris)
levels(iris$Species)[levels(iris$Species)=="setosa"] <- "other"
levels(iris$Species)[levels(iris$Species)=="virginica"] <- "other"
names(iris)=c("SL","SW","PL","PW","Species")
# good model
model <-ksvm(Species ~ ., data = iris,prob.model=TRUE,kpar=list(0.03),C=10)
# bad model
model2 <-ksvm(Species ~ ., data = iris,prob.model=TRUE,kpar=list(10),C=10)
# plot latent variables of approximation and SVM
plotperf(model,iris,indy=5,type="lp",filename="iris")
plotperf(model2,iris,indy=5,type="lp",filename="iris2")
# plot contributions of approximation and SVM
# good model: rest term is small in comparison with other contributions and lpmodel 
# (latent variable of SVM)
plotperf(model,iris,indy=5,type="contributions",filename="iris") 
# bad model: rest term is large in comparison with other contributions and lpmodel 
# (latent variable of SVM)
plotperf(model2,iris,indy=5,type="contributions",filename="iris2")
# plot latent variables of approximation and SVM
plotperf(model,iris,indy=5,type="outcomes",filename="iris")
plotperf(model2,iris,indy=5,type="outcomes",filename="iris2")



