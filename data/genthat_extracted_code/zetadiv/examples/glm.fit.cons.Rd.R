library(zetadiv)


### Name: glm.fit.cons
### Title: Generalized Linear Models fitting method with negative
###   coefficients constraint
### Aliases: glm.fit.cons

### ** Examples

## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- glm.cons(counts ~ outcome + treatment, family = poisson())
glm.D93.ngl <- glm.cons(counts ~ outcome + treatment, family = poisson(),
   method="glm.fit.cons")
summary(glm.D93)
summary(glm.D93.ngl)



