library(fmsb)


### Name: oddsratio
### Title: Calculate odds ratio and its confidence intervals
### Aliases: oddsratio

### ** Examples

 res <- oddsratio(5, 10, 85, 80)
 str(res)
 print(res)
 oddsratio(12, 5, 6, 12)
 oddsratio(12, 5, 6, 12, p.calc.by.independence=FALSE)
 DH <- sample(c("Disease", "Health"), 100, replace=TRUE)
 EN <- sample(c("Exposed", "Nonexposed"), 100, replace=TRUE)
 x <- table(EN, DH)
 oddsratio(x)
 # same as oddsratio(x[1,1], x[2,1], x[1,2], x[2,2])



