library(BradleyTerry2)


### Name: qvcalc.BTabilities
### Title: Quasi Variances for Estimated Abilities
### Aliases: qvcalc.BTabilities

### ** Examples

    
example(baseball)
baseball.qv <- qvcalc(BTabilities(baseballModel2))
print(baseball.qv)
plot(baseball.qv, xlab = "team",
     levelNames = c("Bal", "Bos", "Cle", "Det", "Mil", "NY", "Tor"))



