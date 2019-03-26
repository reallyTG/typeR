library(randomizr)


### Name: obtain_inclusion_probabilities
### Title: Obtain inclusion probabilities
### Aliases: obtain_inclusion_probabilities

### ** Examples


# Draw a stratified random sample
strata <- rep(c("A", "B","C"), times=c(50, 100, 200))

declaration <- declare_rs(strata = strata)

observed_probabilities <-
   obtain_inclusion_probabilities(declaration = declaration)

table(strata, observed_probabilities)


# Sometimes it is convenient to skip the declaration step
observed_probabilities <-
   obtain_inclusion_probabilities(strata = strata)

table(strata, observed_probabilities)




