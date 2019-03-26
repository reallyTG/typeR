library(compare)


### Name: compareIgnoreNameCase
### Title: Compare Two Objects with Different Names
### Aliases: compareIgnoreNameCase compareIgnoreNameCase.data.frame
###   compareIgnoreNames compareIgnoreNames.data.frame
### Keywords: utilities logic

### ** Examples

model <- data.frame(x=1:26, y=letters, z=factor(letters),
                    stringsAsFactors=FALSE)
comparison <- data.frame(a=1:26, b=letters, c=factor(letters),
                         stringsAsFactors=FALSE)
compareIgnoreNames(model, comparison)



