library(micropan)


### Name: binomixEstimate
### Title: Binomial mixture model estimates
### Aliases: binomixEstimate

### ** Examples

# Loading a Panmat object in the micropan package
data(list="Mpneumoniae.blast.panmat",package="micropan")

# Estimating binomial mixture models
bino <- binomixEstimate(Mpneumoniae.blast.panmat,K.range=3:8)  # using 3,4,...,8 components
print(bino$BIC.table) # minimum BIC at 3 components

# Plotting the optimal model, and printing the summary
plot(bino)
summary(bino)

# Plotting the 8-component model as well
plot(bino,ncomp=8)  # clearly overfitted, we do not need this many sectors

# Plotting the distribution in a single genome
plot(bino,type="single")  # completely dominated by core genes




