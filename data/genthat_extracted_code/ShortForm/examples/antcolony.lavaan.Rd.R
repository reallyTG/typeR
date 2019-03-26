library(ShortForm)


### Name: antcolony.lavaan
### Title: A function to implement the ant colony optimization algorithm
###   for short form specification searches with the package lavaan.
### Aliases: antcolony.lavaan

### ** Examples

# a 3-factor example using the HolzingerSwineford1939 data from `lavaan`

# some changes to the default values
# notice that in this example we are recreating the original model
abilityShortForm = antcolony.lavaan(data = lavaan::HolzingerSwineford1939,
ants = 1, evaporation = 0.7, 
antModel = ' visual  =~ x1 + x2 + x3
             textual =~ x4 + x5 + x6
             speed   =~ x7 + x8 + x9 ', 
list.items = list(c('x1',
'x2', 'x3'), c('x4', 'x5', 'x6'), c('x7', 'x8', 'x9')), full = 9, i.per.f =
c(3,3,3), factors = c('visual','textual','speed'), steps = 1, fit.indices =
c('cfi'), fit.statistics.test = "(cfi > 0.6)", summaryfile =
NULL, feedbackfile = NULL, max.run = 2)

## Not run: 
##D # using simulated test data and the default values for lavaan.model.specs
##D # first, read in the original or "full" model
##D data(exampleAntModel) # a character vector for a lavaan model
##D 
##D # then, create the list of the items by the factors
##D # in this case, all items load onto the general 'Ability' factor
##D list.items <- list(c('Item1','Item2','Item3','Item4','Item5',
##D 'Item6','Item7','Item8','Item9','Item10',
##D 'Item11','Item12','Item13','Item14','Item15',
##D 'Item16','Item17','Item18','Item19','Item20',
##D 'Item21','Item22','Item23','Item24','Item25',
##D 'Item26','Item27','Item28','Item29','Item30',
##D 'Item31','Item32','Item33','Item34','Item35',
##D 'Item36','Item37','Item38','Item39','Item40',
##D 'Item41','Item42','Item43','Item44','Item45',
##D 'Item46','Item47','Item48','Item49','Item50',
##D 'Item51','Item52','Item53','Item54','Item55','Item56'))
##D 
##D # load the data
##D data(simulated_test_data)
##D 
##D # finally, call the function with some minor changes to the default values.
##D abilityShortForm = antcolony.lavaan(data = simulated_test_data,
##D ants = 5, evaporation = 0.7, antModel = exampleAntModel,
##D list.items = list.items, full = 56, i.per.f = 20,
##D factors = 'Ability', steps = 3, fit.indices = c('cfi', 'rmsea'),
##D fit.statistics.test = "(cfi > 0.95)&(rmsea < 0.05)",
##D summaryfile = 'summary.txt',
##D feedbackfile = 'iteration.html',
##D max.run = 500)
##D 
##D abilityShortForm[[1]] # print the results of the final short form
## End(Not run)



