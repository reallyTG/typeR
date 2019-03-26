library(BayesLCA)


### Name: Alzheimer
### Title: Symptoms of Patients Suffering from Alzheimer's Syndrome
### Aliases: Alzheimer
### Keywords: datasets Alzheimer Saint James Alzheimers Syndrome

### ** Examples

data(Alzheimer)
fit2 <- blca.em(Alzheimer, 2)
summary(fit2)

fit3<- blca.em(Alzheimer, 3, restarts=25)
summary(fit3)




