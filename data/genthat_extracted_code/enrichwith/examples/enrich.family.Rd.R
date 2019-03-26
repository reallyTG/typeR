library(enrichwith)


### Name: enrich.family
### Title: Enrich objects of class 'family'
### Aliases: enrich.family

### ** Examples


## An example from ?glm to illustrate that things still work with
## enriched families
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- glm(counts ~ outcome + treatment, family = enrich(poisson()))
anova(glm.D93)
summary(glm.D93)



