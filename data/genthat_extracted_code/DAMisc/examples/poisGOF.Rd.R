library(DAMisc)


### Name: poisGOF
### Title: Deviance and Chi-squared Goodness-of-Fit Test for Poisson Models
### Aliases: poisGOF

### ** Examples

## Example taken from MASS help file for glm, identified to be
## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())
poisGOF(glm.D93)



