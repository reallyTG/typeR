library(PCovR)


### Name: SortLoadings
### Title: Sorting a component loading matrix
### Aliases: SortLoadings
### Keywords: regression

### ** Examples

# Compute loading matrix of alexithymia dataset
data(alexithymia)
results <- pcovr(alexithymia$X,alexithymia$Y)
Px <- results$Px
print(Px)

# Sort loading matrix
sorted_Px <- SortLoadings(results$Px)
print(sorted_Px)



