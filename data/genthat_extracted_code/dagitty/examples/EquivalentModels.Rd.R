library(dagitty)


### Name: EquivalentModels
### Title: Generating Equivalent Models
### Aliases: EquivalentModels equivalenceClass equivalentDAGs

### ** Examples

# How many equivalent DAGs are there for the sports DAG example?
g <- getExample("Shrier")
length(equivalentDAGs(g))
# Plot all equivalent DAGs
par( mfrow=c(2,3) )
lapply( equivalentDAGs(g), plot )
# How many edges can be reversed without changing the equivalence class?
sum(edges(equivalenceClass(g))$e == "--")



