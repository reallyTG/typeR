library(eRm)


### Name: plotGR
### Title: Plot Treatment or Covariate Effects for LLRA
### Aliases: plotGR

### ** Examples

##Example 6 from Hatzinger & Rusch (2009)
groups <- c(rep("TG",30),rep("CG",30))
llra1 <- LLRA(llradat3,mpoints=2,groups=groups)
summary(llra1)
plotGR(llra1)

## Not run: 
##D   
##D ##An LLRA with 2 treatment groups and 1 baseline group, 5 items and 4
##D ##time points. Item 1 is dichotomous, all others have 3, 4, 5, 6
##D ##categories respectively.
##D ex2 <- LLRA(llraDat2[1:20],mpoints=4,groups=llraDat2[21])
##D plotGR(ex2)
## End(Not run)



