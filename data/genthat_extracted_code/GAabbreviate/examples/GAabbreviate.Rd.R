library(GAabbreviate)


### Name: GAabbreviate
### Title: Abbreviating items (from questionnaire or other) measures using
###   Genetic Algorithms (GAs)
### Aliases: GAabbreviate
### Keywords: optimize multivariate survey

### ** Examples

### Example using random generated data
nsubject = 100
nitems = 15
set.seed(123)
items = matrix(sample(1:5, nsubject*nitems, replace = TRUE), 
               nrow = nsubject, ncol = nitems)
scales = cbind(rowSums(items[,1:10]), rowSums(items[,11:15]))

GAA = GAabbreviate(items, scales, itemCost = 0.01, maxItems = 5, 
                   popSize = 50, maxiter = 300, run = 100)
plot(GAA)
summary(GAA)
# more info can be retrieved using
GAA$best
GAA$measure



