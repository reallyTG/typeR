library(multilevel)


### Name: sobel
### Title: Estimate Sobel's (1982) Test for Mediation
### Aliases: sobel
### Keywords: htest

### ** Examples

data(bh1996)

#A small but significant indirect effect indicates leadership mediates
#the relationship between work hours and well-being.
sobel(pred=bh1996$HRS,med=bh1996$LEAD,out=bh1996$WBEING)



