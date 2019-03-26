library(ShortForm)


### Name: antcolony.mplus
### Title: A function to implement the ant colony optimization algorithm
###   for short form specification searches, either using MPlus directly
###   via 'system' calls or using Mplus indirectly with the package
###   MplusAutomation.
### Aliases: antcolony.mplus

### ** Examples

## Not run: 
##D # use MplusAutomation to find a 15-item short form of a simulated 56-item unidimensional test
##D # first, create the list of the items by the factors
##D # in this case, all items load onto the general 'Ability' factor
##D list.items <- list(c('Item1','Item2', 'Item3', 'Item4', 'Item5',
##D                      'Item6', 'Item7', 'Item8', 'Item9', 'Item10',
##D                      'Item11','Item12','Item13','Item14','Item15',
##D                      'Item16','Item17','Item18','Item19','Item20',
##D                      'Item21','Item22','Item23','Item24','Item25',
##D                      'Item26','Item27','Item28','Item29','Item30',
##D                      'Item31','Item32','Item33','Item34', 'Item35',
##D                      'Item36','Item37','Item38','Item39','Item40',
##D                      'Item41','Item42','Item43','Item44','Item45',
##D                      'Item46','Item47','Item48','Item49','Item50',
##D                      'Item51','Item52','Item53','Item54','Item55',
##D                      'Item56'))
##D # then, load the data
##D data(simulated_test_data)
##D 
##D # Create the mplusObject with MplusAutomation
##D # notice the explicit call of each item, instead of the shorthand "Item1-Item56"
##D initial.MplusAutomation.model <- MplusAutomation::mplusObject(
##D   TITLE = "Trial ACO MpluAutomation with FERA 2016 Data;",
##D   MODEL = "Ability BY Item1 Item2 Item3 Item4 Item5
##D   Item6 Item7 Item8 Item9 Item10 Item11 Item12
##D   Item13 Item14 Item15 Item16 Item17 Item18
##D   Item19 Item20 Item21 Item22 Item23 Item24
##D   Item25 Item26 Item27 Item28 Item29 Item30
##D   Item31 Item32 Item33 Item34 Item35 Item36
##D   Item37 Item38 Item39 Item40 Item41 Item42
##D   Item43 Item44 Item45 Item46 Item47 Item48
##D   Item49 Item50 Item51 Item52 Item53 Item54
##D   Item55 Item56;",
##D   ANALYSIS = "ESTIMATOR = WLSMV;",
##D   VARIABLE = "CATEGORICAL = Item1 Item2 Item3 Item4 Item5
##D   Item6 Item7 Item8 Item9 Item10 Item11 Item12
##D   Item13 Item14 Item15 Item16 Item17 Item18
##D   Item19 Item20 Item21 Item22 Item23 Item24
##D   Item25 Item26 Item27 Item28 Item29 Item30
##D   Item31 Item32 Item33 Item34 Item35 Item36
##D   Item37 Item38 Item39 Item40 Item41 Item42
##D   Item43 Item44 Item45 Item46 Item47 Item48
##D   Item49 Item50 Item51 Item52 Item53 Item54
##D   Item55 Item56;",
##D   OUTPUT = "stdyx;",
##D   rdata = simulated_test_data
##D )
##D 
##D # finally, call the function with some minor changes to the default values.
##D abilityShortForm = antcolony.mplus(ants = 3, evaporation = 0.7,
##D mplus = initial.MplusAutomation.model,list.items = list.items, full = 56,
##D i.per.f = 15, factors = 'Ability', steps = 3, max.run = 50, resultfile = NULL,
##D summaryfile = 'C:/Users/lordmaxwell/Desktop/summary.txt',
##D min.CFI = 0.95, min.TLI = 0.95, max.RMSEA = 0.06,
##D feedbackfile = 'C:/Users/lordmaxwell/Desktop/iteration.html', Mplus.Automation=TRUE,
##D dataOut = 'exampleModel.dat',
##D modelOut = 'exampleModel.inp')
## End(Not run)



