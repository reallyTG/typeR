library(BSDA)


### Name: Mathpro
### Title: Math proficiency and SAT scores by states
### Aliases: Mathpro
### Keywords: datasets

### ** Examples


model <- lm(sat_math ~ profic, data = Mathpro)
plot(sat_math ~ profic, data = Mathpro, ylab = "SAT", xlab = "proficiency")
abline(model, col = "red")
summary(model)
rm(model)




