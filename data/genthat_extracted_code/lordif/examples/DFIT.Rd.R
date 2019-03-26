library(lordif)


### Name: DFIT
### Title: calculates DFIT statistics
### Aliases: DFIT

### ** Examples

##load PROMIS Anxiety sample data (n=766)
## Not run: data(Anxiety)
##age : 0=younger than 65 or 1=65 or older
##run age-related DIF on all 29 items (takes about a minute)
## Not run: age.DIF <- lordif(Anxiety[paste("R",1:29,sep="")],Anxiety$age)
##run DFIT
## Not run: age.DIF.DFIT <- DFIT(age.DIF)



