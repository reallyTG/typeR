library(ShortForm)


### Name: tabuShortForm
### Title: Short Form Tabu Search
### Aliases: tabuShortForm

### ** Examples

shortAntModel = '
Ability =~ Item1 + Item2 + Item3 + Item4 + Item5 + Item6 + Item7 + Item8
Ability ~ Outcome
'
data(simulated_test_data)
tabuResult <- tabuShortForm(initialModel = shortAntModel,
                             originalData = simulated_test_data, numItems = 7,
                             allItems = colnames(simulated_test_data)[3:11],
                             niter = 1, tabu.size = 3)
lavaan::summary(tabuResult$best.mod) # shows the resulting model




