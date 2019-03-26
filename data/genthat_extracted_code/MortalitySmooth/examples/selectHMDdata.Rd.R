library(MortalitySmooth)


### Name: selectHMDdata
### Title: Selecting Data from the HMDdata Object
### Aliases: selectHMDdata
### Keywords: datasets

### ** Examples

## "Complete" example
x <- 1950:2000
den50 <- selectHMDdata("Denmark", "Death", "Females", 50, x)
plot(x, den50, main="Danish female deaths at age 50")
## "Incomplete" example with warning
jap50 <- selectHMDdata("jap", "Pop", "F", 50)
## Wrong example (don't run)
## selectHMDdata("Sw", "Pop", "F", 50, 2000)
## Sw can stand for both Sweden and Switzerland



