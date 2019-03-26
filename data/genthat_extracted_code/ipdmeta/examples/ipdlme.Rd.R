library(ipdmeta)


### Name: ipdlme
### Title: IPD Linear Mixed-Effects Models from Aggregate Data
### Aliases: ipdlme
### Keywords: models methods

### ** Examples

data(regress_age)

# Homogeneous residual variance
metafit <- ipdlme(n,Y,S2)

summary(metafit)

fixef(metafit)
confint(metafit)

ranef(metafit)

labs <- paste("Center",c(1,10,11,2:9))
plot(metafit, y=labs)

#Heterogeneous residual variance
metafit <- ipdlme(n,Y,S2,equal=FALSE)

summary(metafit)

fixef(metafit)
confint(metafit)

ranef(metafit)

labs <- paste("Center",c(1,10,11,2:9))
plot(metafit, y=labs)



