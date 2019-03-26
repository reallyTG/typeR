library(rv)


### Name: rvcat
### Title: Generate Categorical Random Variables
### Aliases: rvcat
### Keywords: classes

### ** Examples


  rvcat(1, prob=c(0.5, 0.3, 0.2)) # default levels: 1, 2, 3
  rvcat(1, prob=c(5, 3, 2)) # same as above
  p <- rvdirichlet(1, alpha=c(0.7, 0.3)) # prior probabilities
  rvcat(1, prob=p, levels=c("Group 1", "Group 2"))




