library(GAparsimony)


### Name: parsimony_rerank
### Title: Function for reranking by complexity in parsimonious model
###   selection process
### Aliases: parsimony_rerank

### ** Examples

library(GAparsimony)
object <- new("ga_parsimony", 
              rerank_error=0.2,
              best_score = 2.0,
              popSize = 4, 
              fitnessval = c(2.0, 1.9, 1.1, 1.0), 
              complexity=c(2,1,2,1))

pop_ini <- data.frame(fitnessval=object@fitnessval, 
                      complexity=object@complexity)
print("INITIAL POPULATION:")
print(pop_ini)

print("POPULATION ORDERED BY COMPLEXITY")
print(paste0("WHEN abs(diff(fitnessval)) < ",
             object@rerank_error,":"))
pop_ini[parsimony_rerank(object),]



