library(fma)


### Name: jcars
### Title: Motor vehicle production
### Aliases: jcars
### Keywords: datasets

### ** Examples
plot(jcars)
log.jcars <- BoxCox(jcars,0)
jcars.f <- holt(log.jcars)
plot(jcars.f)



