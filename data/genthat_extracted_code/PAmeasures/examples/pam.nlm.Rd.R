library(PAmeasures)


### Name: pam.nlm
### Title: Prediction Accuracy Measures for Nonlinear Regression Models.
### Aliases: pam.nlm

### ** Examples

library(PAmeasures)

data(moore)

head(moore)

# Transistor count
count <- moore$count

time<-moore$time

# Fit a log-linear model
moore.glm= glm(log2(count) ~ time, family=gaussian(link = "identity") )

# Obtain predicted transistor count
count.predict<-2^(predict(moore.glm,newdata = data.frame(X = time),type = "response" ))

# R.squared and L.squared of log-linear model
pam.nlm(count, count.predict)



