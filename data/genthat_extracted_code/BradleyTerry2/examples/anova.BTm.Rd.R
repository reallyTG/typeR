library(BradleyTerry2)


### Name: anova.BTm
### Title: Compare Nested Bradley Terry Models
### Aliases: anova.BTm
### Keywords: models

### ** Examples


result <- rep(1, nrow(flatlizards$contests))
BTmodel <- BTm(result, winner, loser, ~ throat.PC1[..] + throat.PC3[..] +
               head.length[..] + (1|..), data = flatlizards,
               trace = TRUE)
anova(BTmodel)




