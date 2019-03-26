library(DAAG)


### Name: nassCDS
### Title: Airbag and other influences on accident fatalities
### Aliases: nassCDS
### Keywords: datasets

### ** Examples

data(nassCDS)
xtabs(weight ~ dead + airbag, data=nassCDS)
xtabs(weight ~ dead + airbag + seatbelt + dvcat, data=nassCDS)
tab <- xtabs(weight ~ dead + abcat, data=nassCDS,
             subset=dvcat=="25-39"&frontal==0)[, c(3,1,2)]
round(tab[2, ]/apply(tab,2,sum)*100,2)



