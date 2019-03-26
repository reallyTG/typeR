library(rAverage)


### Name: outlier.replace
### Title: Outlier detection and substitution
### Aliases: outlier.replace
### Keywords: misc

### ** Examples

data(pasta)
model <- rav(pasta, subset="s04", lev=c(3,3), names=c("Price","Packaging"))
outlier.replace(model, value=mean)
outlier.replace(model, whichModel="IC", value=NA)



