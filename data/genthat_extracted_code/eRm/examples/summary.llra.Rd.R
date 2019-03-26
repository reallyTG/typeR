library(eRm)


### Name: summary.llra
### Title: Summarizing Linear Logistic Models with Relaxed Assumptions
###   (LLRA)
### Aliases: summary.llra print.summary.llra

### ** Examples

##Example 6 from Hatzinger & Rusch (2009)
groups <- c(rep("TG",30),rep("CG",30))
llra1 <- LLRA(llradat3,mpoints=2,groups=groups)
summary(llra1)

## Not run: 
##D ##An LLRA with 2 treatment groups and 1 baseline group, 5 items and 4
##D ##time points. Item 1 is dichotomous, all others have 3, 4, 5, 6
##D ##categories respectively.
##D ex2 <- LLRA(llraDat2[1:20],mpoints=4,llraDat2[21])
##D sumEx2 <- summary(ex2, level=0.95)
##D 
##D #print a summary
##D sumEx2
##D 
##D #get confidence intervals
##D sumEx2$ci
## End(Not run)



