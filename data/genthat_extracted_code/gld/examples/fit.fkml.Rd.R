library(gld)


### Name: fit.fkml
### Title: Estimate parameters of the FKML parameterisation of the
###   generalised lambda distribution
### Aliases: fit.fkml
### Keywords: distribution

### ** Examples

example.data <- rgl(200,c(3,1,.4,-0.1),param="fkml")
example.fit <- fit.fkml(example.data,"MSP",return.data=TRUE)
print(example.fit)
summary(example.fit)
plot(example.fit,one.page=FALSE)



