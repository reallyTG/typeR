library(MESS)


### Name: monte_carlo_chisq_test
### Title: Two-sided table test with fixed margins
### Aliases: monte_carlo_chisq_test
### Keywords: manip

### ** Examples


m <- matrix(c(12, 4, 8, 6), 2)
chisq.test(m)
chisq.test(m, correct=FALSE)
monte_carlo_chisq_test(m)

fisher.test(m)
monte_carlo_chisq_test(m, margin="both")

m2 <- matrix(c(9, 3, 3, 7), 2)
monte_carlo_chisq_test(m, margin="N")
monte_carlo_chisq_test(m, margin="both") 




