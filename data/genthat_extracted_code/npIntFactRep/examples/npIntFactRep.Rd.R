library(npIntFactRep)


### Name: npIntFactRep
### Title: Nonparametric Interaction Tests for Factorial Designs with
###   Repeated Measures
### Aliases: npIntFactRep

### ** Examples

## Not run: 
##D dat1 <- read.csv (file="c:/R/wide.csv", head=T)
##D npIntFactRep(dat1)
## End(Not run)
# example with character values for both group and subj variables (columns)
dat2 <- read.table(header = TRUE, text = "
subj group x1 x2 x3 x4
 p1 a 1 2 3 4
 p2 a 2 2 3 3
 p3 a 1 3 3 4
 p4 b 8 6 4 2
 p5 b 6 6 4 4
 p6 b 8 6 6 2
 p7 c 4 4 4 3
 p8 c 3 3 3 4
 p9 c 3 4 4 2
 ")
npIntFactRep(dat2)
# example with numeric values for the subj variable and charater values for the group variable
dat3 <- read.table(header = TRUE, text = "
subj group 1 2 3 4 5
1 a1 1 2 3 4 5
2 a1 2 2 3 3 3
3 a1 1 3 3 4 2
4 a2 8 6 4 2 1
5 a2 6 6 4 4 4
6 a2 8 6 6 2 3
")
npIntFactRep(dat3)



