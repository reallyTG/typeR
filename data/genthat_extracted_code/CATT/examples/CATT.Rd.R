library(CATT)


### Name: CATT
### Title: The Cochran-Armitage Trend Test
### Aliases: CATT
### Keywords: Cochran-Armitage; Trend Test

### ** Examples

# type of data is variable
binomial=c(rep(0,20),rep(1,10),rep(0,20),rep(1,20),rep(0,20),rep(1,30))
ordinal=c(rep(0,30),rep(1,40),rep(2,50))
CATT(binomial=binomial,ordinal=ordinal)

# type of data is table
tbl=matrix(c(20,10,20,20,20,30),nrow=2)
CATT(table=tbl)



