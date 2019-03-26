library(Rcapture)


### Name: HIV
### Title: Epidemiological capture-recapture Data on HIV
### Aliases: HIV
### Keywords: datasets

### ** Examples

data(HIV)
desc <- descriptive(HIV, dfreq=TRUE)
desc
  # 1774 out of 1896 individuals (94%) appear on one list only.

plot(desc)
  # The fi plot is linear showing that heterogeneity is not a problem.  
  # Models with a time (or list) effect and possible pairwise dependencies 
  # between lists will be considered.

cp.m1 <- closedpCI.t(HIV, dfreq = TRUE, mX = ~ (c1+c2+c3+c4)^2, 
                     mname = "Mt double interaction")
cp.m1
  # The model fits well. Let's find out which interactions are important.
summary(cp.m1$fit)$coefficients
  # Eliminating the non significant interactions stepwise shows that only 
  # the [1,2] interaction is important.

closedpCI.t(HIV, dfreq = TRUE, mX = ~ . + c1:c2, mname = "Mt interaction 1,2")



