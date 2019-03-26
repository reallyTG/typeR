library(GLDreg)


### Name: fun.mean.convert
### Title: Convert a RS or FKML GLD into RS or FKML GLD to the desired
###   theoretical mean by changing only the first parameter
### Aliases: fun.mean.convert
### Keywords: univar

### ** Examples


# Transform RS GLD with parameters 3,2,1,1 to mean of 0
fun.mean.convert(c(3,2,1,1),param="rs")

# Check that the desired outcome is achieved
fun.theo.mv.gld(0,2,1,1,param="rs")

# Transform RS GLD with parameters 3,2,1,1 to mean of 5
fun.mean.convert(c(3,2,1,1),param="fkml",5)

# Check that the desired outcome is achieved
fun.theo.mv.gld(5,2,1,1,param="fkml")




