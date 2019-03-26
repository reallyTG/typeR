library(malariaAtlas)


### Name: convertPrevalence
### Title: convert prevalences from one age range to another
### Aliases: convertPrevalence

### ** Examples

# Convert from prevalence 2 to 5 to prevalence 2 to 10
pr2_10 <- convertPrevalence(0.1, 2, 5, 2, 10)

# Convert many surveys all to 2 to 10.
pr <- runif(20, 0.1, 0.15)
min_in <- sample(1:5, 20, replace = TRUE)
max_in <- rep(8, 20)
min_out <- rep(2, 20)
max_out <- rep(10, 20)
pr_standardised <- convertPrevalence(pr, min_in, max_in,
                                     min_out, max_out)

plot(pr_standardised, pr)



