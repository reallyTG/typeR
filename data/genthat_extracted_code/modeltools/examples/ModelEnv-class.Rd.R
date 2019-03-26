library(modeltools)


### Name: ModelEnv-class
### Title: Class "ModelEnv"
### Aliases: ModelEnv-class clone clone,ModelEnv-method dimension
###   dimension,ModelEnv,character-method empty empty,ModelEnv-method has
###   has,ModelEnv,character-method initialize,ModelEnv-method
###   show,ModelEnv-method subset,ModelEnv-method subset
###   na.pass,ModelEnv-method na.pass na.fail,ModelEnv-method na.fail
###   na.omit,ModelEnv-method na.omit
### Keywords: classes

### ** Examples


### a new object
me <- new("ModelEnv")

## the new model environment is empty
empty(me)

### define a bivariate response variable
me@set("response", data.frame(y = rnorm(10), x = runif(10)))
me

## now it is no longer empty
empty(me)

### check if a response is available
has(me, "response")

### the dimensions
dimension(me, "response")

### extract the data
me@get("response")

df <- data.frame(x = rnorm(10), y = rnorm(10))

## hook for set method:
mf <- ModelEnvFormula(y ~ x-1, data = df, setHook=list(designMatrix=scale))
mf@get("designMatrix")
mf@set(data=df[1:5,])
mf@get("designMatrix")

### NA handling
df$x[1] <- NA
mf <- ModelEnvFormula(y ~ x, data = df, na.action = na.pass)
mf
na.omit(mf)



