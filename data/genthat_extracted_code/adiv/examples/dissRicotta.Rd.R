library(adiv)


### Name: dissRicotta
### Title: Plot-to-Plot Functional or Phylogenetic Dissimilarity
### Aliases: dissRicotta
### Keywords: models

### ** Examples

# Phylogenetic tree
s<-"test(((v:20,w:20):10,(x:20,y:20):10):15,z:45):5;"
plot(test <- read.tree(text=s))

# Phylogenetic distances among species
tdist <- cophenetic(test)/100

# Matrix of abundances of the species in four communities; 
# communities A and C are identical;
# communities B and D are identical;
comm <- t(data.frame(A = rep(0.2, 5), 
B = c(0.1, 0.2, 0.2, 0, 0.5), C = rep(0.2, 5), 
D = c(0.1, 0.2, 0.2, 0, 0.5), row.names = letters[22:26]))

# Index DAB
dissRicotta(comm, tdist)



