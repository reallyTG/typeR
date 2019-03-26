library(bcROCsurface)


### Name: rhoMLogit
### Title: Fitting disease models via multinomial logistic models
### Aliases: rhoMLogit

### ** Examples

data(EOC)
Dna <- preDATA(EOC$D, EOC$CA125)
Dfact.na <- Dna$D
out <- rhoMLogit(Dfact.na ~ CA125 + CA153 + Age, data = EOC, test = TRUE,
                 trace = TRUE)




