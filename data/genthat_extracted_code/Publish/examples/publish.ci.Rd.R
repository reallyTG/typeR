library(Publish)


### Name: publish.ci
### Title: Publish tables with confidence intervals
### Aliases: publish.ci

### ** Examples


data(Diabetes)
publish(ci.mean(chol~location+gender,data=Diabetes),org=TRUE)




