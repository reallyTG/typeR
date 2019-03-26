library(eRm)


### Name: RM
### Title: Estimation of Rasch Models
### Aliases: RM
### Keywords: models

### ** Examples

# Rasch model with beta.1 restricted to 0
res <- RM(raschdat1, sum0 = FALSE)
res
summary(res)
res$W                                       #generated design matrix

# Rasch model with sum-0 beta restriction; no standard errors computed
res <- RM(raschdat1, se = FALSE, sum0 = TRUE)
res
summary(res)
res$W                                       #generated design matrix

#Rasch model with missing values
res <- RM(raschdat2)
res
summary(res)



