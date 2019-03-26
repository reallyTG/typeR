library(sensors4plumes)


### Name: optimiseSD_genetic
### Title: Optimisation of sensor locations by a binary genetic algorithm
### Aliases: optimiseSD_genetic numberPenalty

### ** Examples

# load data and compute required properties
demo(radioactivePlumes_addProperties)

# initial, fix, possible sensor locations
I = nLocations(radioactivePlumes)
set.seed(1000)
locInit_l = t(replicate(10, sample.int(I, 5))) 
locKeep_l = sample(setdiff(1:I, locInit_l), 2)
locAll_l = c(sample(setdiff(1:I, c(locInit_l, locKeep_l)),
                          round(I - (5 + 2)) * 0.5), locInit_l)

# the function is to be used inside of optimiseSD
# change algorithm specific parameters 'evalFunc', 'popSize', 'iters'
optimiseSD_genetic_1 = replaceDefault(
  optimiseSD_genetic, newDefaults = list(
    evalFunc = numberPenalty,
    popSize = 20,
    iters = 10
  ),
  type = "optimisationFun.optimiseSD")[[1]]

# run optimisation
## Not run: 
##D ## takes some time
##D OptSD_gen1 = optimiseSD(
##D   simulations = radioactivePlumes,
##D   costFun = singleDetection,
##D   optimisationFun = optimiseSD_genetic_1,
##D   locationsAll = locAll_l,
##D   locationsFix = locKeep_l,
##D   locationsInitial = locInit_l[1,])
## End(Not run)
## this result is also in data(SDgenetic)

## Not run: 
##D # result is not returned but saved to file
##D ## case with 'aimCost'
##D optimiseSD_genetic_2 = replaceDefault(
##D     optimiseSD_genetic, newDefaults = list(
##D       evalFunc = numberPenalty,
##D       popSize = 20,
##D       iters = 20
##D     ),
##D     type = "optimisationFun.optimiseSD")[[1]]
##D 
##D set.seed(07021916)
##D OptSD_gen2 = optimiseSD(
##D   simulations = radioactivePlumes,
##D   costFun = singleDetection,
##D   optimisationFun = optimiseSD_genetic_2,
##D   locationsAll = locAll_l,
##D   locationsFix = locKeep_l,
##D   locationsInitial = locInit_l[1,],
##D   aimCost = 0.05,
##D   nameSave = "optSD_genetic_2" # result is saved to file here
##D )
##D # OptSD_gen2 not found
##D ## load generated populations and extract sampling designs and cost
##D load("optSD_genetic_2.Rdata")
##D finalIteration = sum(!is.na(populations[1,1,]))
##D costs = matrix(0, nrow = finalIteration, ncol = 20)
##D SDs = list()
##D for (j in 1:finalIteration){
##D   SDs[[j]] = list()
##D   for (i in 1:20){
##D     costs[j,i] = numberPenalty(populations[i,,j],
##D       simulations = radioactivePlumes,
##D       costFun = singleDetection,
##D       locationsAll = locAll_l,
##D       locationsFix = locKeep_l,
##D       aimNumber = length(locInit_l[1,]))
##D     SDs[[j]][[i]] = c(locAll_l[populations[i,,j] == 1], locKeep_l)
##D     if (sum(populations[i,,j]) > 5){
##D       costs[j,i] = 2
##D     }
##D     print(paste(j,i))
##D   }
##D }
##D apply(FUN = min, X = costs, MARGIN = 1) # best cost in each iteration
##D # best sampling design:
##D SDs[[finalIteration]][[which(costs[finalIteration,] == min(costs[finalIteration,]))]]
## End(Not run)



