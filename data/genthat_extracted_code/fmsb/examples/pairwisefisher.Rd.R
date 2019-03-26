library(fmsb)


### Name: pairwise.fisher.test
### Title: Exact version of pairwise.prop.test
### Aliases: pairwise.fisher.test

### ** Examples

 pairwise.fisher.test(c(2, 4, 5), c(10, 14, 17), p.adjust.method="bonferroni")
 smoker <- c(2, 1, 7)
 total <- c(11, 14, 10)
 names(total) <- c("A", "B", "C")
 pairwise.fisher.test(smoker, total)



