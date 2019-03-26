library(vcdExtra)


### Name: DaytonSurvey
### Title: Dayton Student Survey on Substance Use
### Aliases: DaytonSurvey
### Keywords: datasets

### ** Examples

data(DaytonSurvey)

mod.GR <- glm(Freq ~ . + sex*race, data=DaytonSurvey, family=poisson)  # mutual independence + GR
mod.homog.assoc <- glm(Freq ~ .^2, data=DaytonSurvey, family=poisson)  # homogeneous association

# collapse over sex and race
Dayton.ACM <- aggregate(Freq ~ cigarette+alcohol+marijuana, data=DaytonSurvey, FUN=sum)




