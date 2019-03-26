library(eRm)


### Name: LLRA
### Title: Fit Linear Logistic Models with Relaxed Assumptions (LLRA)
### Aliases: LLRA print.llra

### ** Examples

##Example 6 from Hatzinger & Rusch (2009)
groups <- c(rep("TG",30),rep("CG",30))
llra1 <- LLRA(llradat3,mpoints=2,groups=groups)
llra1

## Not run: 
##D ##An LLRA with 2 treatment groups and 1 baseline group, 5 items and 4
##D ##time points. Item 1 is dichotomous, all others have 3, 4, 5, 6
##D ##categories respectively.
##D dats <- llraDat2[1:20]
##D groups <- llraDat2$group
##D tps <- 4
##D 
##D #baseline CG
##D ex2 <- LLRA(dats,mpoints=tps,groups=groups) 
##D 
##D #baseline TG1
##D ex2a <- LLRA(dats,mpoints=tps,groups=groups,baseline="TG1") 
##D 
##D #summarize results
##D summary(ex2)
##D summary(ex2a)
##D 
##D #plotting
##D plotGR(ex2)
##D plotTR(ex2)
## End(Not run)



