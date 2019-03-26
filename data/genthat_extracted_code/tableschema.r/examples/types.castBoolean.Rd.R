library(tableschema.r)


### Name: types.castBoolean
### Title: Cast boolean
### Aliases: types.castBoolean

### ** Examples


types.castBoolean(format = "default", value =  TRUE)

types.castBoolean(format = "default", value = "true")

types.castBoolean(format = "default", value = "1")

types.castBoolean(format = "default", value = "0")

# set options with additional true value
types.castBoolean(format = "default", value = "yes", list(trueValues = list("yes")))

# set options with additional false value
types.castBoolean(format = "default", value = "no", list(falseValues  = list("no")))




