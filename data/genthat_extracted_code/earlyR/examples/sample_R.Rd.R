library(earlyR)


### Name: sample_R
### Title: Get a sample of plausible Reproduction Numbers
### Aliases: sample_R

### ** Examples


if (require(incidence)) {
 x <- incidence(c(1, 5, 5, 12, 45, 65))
 plot(x)
 res <- get_R(x, disease = "ebola")
 res
 plot(res)

 sample_R(res, 10)
 hist(sample_R(res, 1000), col = "grey", border = "white")
}




