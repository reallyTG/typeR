library(psych)


### Name: Dwyer
### Title: 8 cognitive variables used by Dwyer for an example.
### Aliases: Dwyer
### Keywords: datasets

### ** Examples

data(Dwyer)
Ro <- Dwyer[1:7,1:7]
Roe <- Dwyer[1:7,8]
fo <- fa(Ro,2,rotate="none")
fa.extension(Roe,fo)



