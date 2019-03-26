library(vcdExtra)


### Name: Kway
### Title: Fit All K-way Models in a GLM
### Aliases: Kway
### Keywords: models

### ** Examples

## artificial data
factors <- expand.grid(A=factor(1:3), B=factor(1:2), C=factor(1:3), D=factor(1:2))
Freq <- rpois(nrow(factors), lambda=40)
df <- cbind(factors, Freq)

mods3 <- Kway(Freq ~ A + B + C, data=df, family=poisson)
LRstats(mods3)
mods4 <- Kway(Freq ~ A + B + C + D, data=df, family=poisson)
LRstats(mods4)

# JobSatisfaction data
data(JobSatisfaction, package="vcd")
modSat <- Kway(Freq ~ management+supervisor+own, data=JobSatisfaction, 
               family=poisson, prefix="JobSat")
LRstats(modSat)
anova(modSat, test="Chisq")

# Rochdale data: very sparse, in table form
data(Rochdale, package="vcd")
## Not run: 
##D modRoch <- Kway(Freq~EconActive + Age + HusbandEmployed + Child + 
##D                      Education + HusbandEducation + Asian + HouseholdWorking,
##D                 data=Rochdale, family=poisson)
##D LRstats(modRoch)
## End(Not run)



