library(spsurvey)


### Name: change.est
### Title: Category Proportion and Size Estimates
### Aliases: change.est
### Keywords: survey univar

### ** Examples

# Categorical variable example:
z_1 <- sample(c("Good","Fair","Poor"), 100, replace=TRUE)
z_2 <- sample(c("Good","Fair","Poor"), 100, replace=TRUE)
wgt_1 <- runif(100, 10, 100)
wgt_2 <- runif(100, 10, 100)
repeat_1 <- rep(c(TRUE,FALSE), c(20,80))
repeat_2 <- rep(c(TRUE,FALSE), c(20,80))
stratum_1 <- rep(c("Stratum1", "Stratum2"), 50)
stratum_2 <- rep(c("Stratum1", "Stratum2"), 50)
change.est(resp.ind="cat", z_1=z_1, wgt_1=wgt_1, repeat_1=repeat_1,
   z_2=z_2, wgt_2=wgt_2, repeat_2=repeat_2, stratum_1=stratum_1,
   stratum_2=stratum_2, vartype_1="SRS", vartype_2="SRS")

# Continuous variable example:
z_1 <- rnorm(100, 10,10)
z_2 <- rnorm(100, 12, 10)
stratum_1 <- rep(c("Stratum1", "Stratum2"), 50)
stratum_2 <- rep(c("Stratum1", "Stratum2"), 50)
change.est(resp.ind="cont", z_1=z_1, wgt_1=wgt_1, repeat_1=repeat_1,
   z_2=z_2, wgt_2=wgt_2, repeat_2=repeat_2, stratum_1=stratum_1,
   stratum_2=stratum_2, vartype_1="SRS", vartype_2="SRS")



