library(caMST)


### Name: computerized_adaptive_test
### Title: Computerized Adaptive Test
### Aliases: computerized_adaptive_test

### ** Examples

data(example_thetas) # 5 simulated abilities
data(example_responses) # 5 simulated responses
data(cat_items) # using just the CAT routing stage items
catResults <- computerized_adaptive_test(cat_item_bank = cat_items,
response_matrix = example_responses, randomesque = 1, maxItems = 3,
nextItemControl = list(criterion = "MFI",
priorDist = "norm", priorPar = c(0, 1), D = 1, range = c(-4, 4),
parInt = c(-4, 4, 33), infoType = "Fisher", randomesque = 1, random.seed = NULL,
rule = "precision", thr = .3, nAvailable = NULL,
cbControl = NULL, cbGroup = NULL))



