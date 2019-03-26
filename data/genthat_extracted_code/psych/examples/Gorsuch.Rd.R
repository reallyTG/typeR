library(psych)


### Name: Gorsuch
### Title: Example data set from Gorsuch (1997) for an example factor
###   extension.
### Aliases: Gorsuch
### Keywords: datasets

### ** Examples

data(Gorsuch)

Ro <- Gorsuch[1:6,1:6]
Roe <- Gorsuch[1:6,7:10]
fo <- fa(Ro,2,rotate="none")
fa.extension(Roe,fo,correct=FALSE)



