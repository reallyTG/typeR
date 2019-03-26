library(demogR)


### Name: project.leslie
### Title: project.leslie
### Aliases: project.leslie
### Keywords: array algebra

### ** Examples

data(goodman)
ult <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
mx <- goodman$usa.bx/goodman$usa.nKx
usa <- leslie.matrix(lx=ult$nLx,mx=mx)

## initial population is the age structure in 1967
## this includes the number of 0-1 year-olds and the number of 1-4
## year-olds, which need to be combined into a single 5-year wide
## element 

no <- goodman$usa.nKx[3:11]
no <- c(sum(goodman$usa.nKx[1:2]),no)/1e6

N <- project.leslie(usa,no,tmax=20)
plot( seq(1967,2067,by=5), apply(N,2,sum), 
         type="l", 
	 xlab="Years", 
	 ylab="Projected Population (millions)")
title("Projected Total Population Size (Ages 0-45) of the United States")

##   Note that this is a lousy projection since it assumes constant
##   demographic rates and a closed population and only accounts for
##   ages 0-45



