library(moult)


### Name: moult
### Title: Models to analyse data of moult in birds
### Aliases: moult print.moult summary.moult logLik.moult moult_alternative

### ** Examples


data(sanderlings)

m2 <- moult(MIndex ~ Day, data = sanderlings) 
summary(m2)



