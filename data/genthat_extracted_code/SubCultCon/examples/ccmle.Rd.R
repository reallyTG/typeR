library(SubCultCon)


### Name: ccmle
### Title: Maximum Likelihood Estimation of Cultural Competence Scores
### Aliases: ccmle
### Keywords: subculture maximum likelihood

### ** Examples

data(contagion)
## Compute the competence scores and the answer key for the contagion data
mlescores=ccmle(contagion$answermat)
## make a histogram of the competence scores
hist(mlescores$comp,main="Competency Scores for the Informants",br=28:50/50)
## look at the answer key
mlescores$key



