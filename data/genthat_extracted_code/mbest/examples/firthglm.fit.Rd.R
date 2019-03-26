library(mbest)


### Name: firthglm.fit
### Title: Fitting Generalized Linear Models with Firth's Bias Reduction
### Aliases: firthglm.fit firthglm.control
### Keywords: models regression

### ** Examples

## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)

## Use firthglm.fit instead of glm.fit:
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson(),
               method="firthglm.fit")
summary(glm.D93)



