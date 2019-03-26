library(jtools)


### Name: summ.glm
### Title: Generalized linear regression summaries with options
### Aliases: summ.glm j_summ.glm

### ** Examples

 ## Dobson (1990) Page 93: Randomized Controlled Trial :
 counts <- c(18,17,15,20,10,20,25,13,12)
 outcome <- gl(3,1,9)
 treatment <- gl(3,3)
 print(d.AD <- data.frame(treatment, outcome, counts))
 glm.D93 <- glm(counts ~ outcome + treatment, family = poisson)

 # Summarize with standardized coefficients
 summ(glm.D93, scale = TRUE)




