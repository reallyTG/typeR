library(hoa)


### Name: fungal
### Title: Fungal Infections Treatment Data
### Aliases: fungal
### Keywords: datasets

### ** Examples

## (full data analysis)
data(fungal)
fungal.glm <- glm(cbind(success, failure) ~ center + group - 1, 
                  family = binomial, data = fungal, 
                  control = glm.control(maxit = 50, epsilon = 1e-005))
fungal.cond <- cond(fungal.glm, groupT)
plot(fungal.cond, which = 2)
## (partial data analysis) 
fungal.glm <- glm(cbind(success, failure) ~ center + group - 1, 
                  family = binomial, data = fungal, subset = -c(1,2,5,6), 
                  control = glm.control(maxit = 50, epsilon = 1e-005))
fungal.cond <- cond(fungal.glm, groupT)
plot(fungal.cond, which = 2)
## (Tables 1 and 3 are omitted).



