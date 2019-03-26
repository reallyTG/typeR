library(CAMAN)


### Name: thai_cohort
### Title: Cohort study in north east Thailand
### Aliases: thai_cohort
### Keywords: datasets

### ** Examples

data("thai_cohort")
mix <- mixalg(obs="counts", weights="frequency", family="poisson", data=thai_cohort,
              numiter=18000, acc=0.00001, startk=25)



