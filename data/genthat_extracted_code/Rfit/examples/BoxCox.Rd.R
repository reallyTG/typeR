library(Rfit)


### Name: BoxCox
### Title: Box and Cox (1964) data.
### Aliases: BoxCox
### Keywords: datasets

### ** Examples

data(BoxCox)
with(BoxCox,interaction.plot(Treatment,Poison,logSurv,median))
raov(logSurv~Poison+Treatment,data=BoxCox)



