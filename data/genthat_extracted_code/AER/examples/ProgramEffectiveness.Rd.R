library(AER)


### Name: ProgramEffectiveness
### Title: Program Effectiveness Data
### Aliases: ProgramEffectiveness
### Keywords: datasets

### ** Examples

data("ProgramEffectiveness")

## Greene (2003), Table 21.1, col. "Probit"
fm_probit <- glm(grade ~ average + testscore + participation,
  data = ProgramEffectiveness, family = binomial(link = "probit"))
summary(fm_probit)



