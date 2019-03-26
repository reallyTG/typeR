library(extRemes)


### Name: Denversp
### Title: Denver July hourly precipitation amount.
### Aliases: Denversp
### Keywords: datasets

### ** Examples

data(Denversp)
plot( Denversp[,1], Denversp[,4], xlab="", ylab="Hourly precipitation (mm)", xaxt="n")
axis(1,at=c(50,60,70,80,90),labels=c("1950","1960","1970","1980","1990"))



