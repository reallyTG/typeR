library(heemod)


### Name: who_mortality
### Title: Use WHO Mortality Rate
### Aliases: who_mortality get_who_mr_memo get_who_mr

### ** Examples


define_transition(
  C, get_who_mr(age = 50 + markov_cycle, sex = "FMLE", country = "FRA"),
  0, 1
)




