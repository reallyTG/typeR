library(Gmisc)


### Name: describeFactors
### Title: Describes factor variables
### Aliases: describeFactors

### ** Examples

set.seed(1)
describeFactors(sample(50, x=c("A","B", "C"), replace=TRUE))

n <- 500
my_var <- factor(sample(size=n, x=c("A","B", "C", NA), replace=TRUE))
my_exp <- rbinom(n=n, size=1, prob=0.2)
total <- table(my_var, useNA="ifany")
by(my_var,
   INDICES=my_exp,
   FUN=describeFactors,
   useNA="ifany",
   horizontal_proportions = total)




