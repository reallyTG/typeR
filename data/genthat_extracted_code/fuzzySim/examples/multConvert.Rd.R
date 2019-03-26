library(fuzzySim)


### Name: multConvert
### Title: Multiple conversion
### Aliases: multConvert
### Keywords: manip classes

### ** Examples

data(rotif.env)

str(rotif.env)

# convert the first 4 columns to character:
converted.rotif.env <- multConvert(data = rotif.env, 
conversion = as.character, cols = 1:4)

str(converted.rotif.env)


names(rotif.env)

# divide some columns by 100:

div100 <- function(x) x / 100

rotif.env.cent <- multConvert(data = rotif.env, 
conversion = div100, cols = c(6:10, 12:17))

head(rotif.env.cent)



