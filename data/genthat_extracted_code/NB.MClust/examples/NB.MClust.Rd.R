library(NB.MClust)


### Name: NB.MClust
### Title: NB.MClust Function
### Aliases: NB.MClust
### Keywords: NB.MClust

### ** Examples

# Example:

data("Simulated_Count") # A 50x100 integer data frame.

m1=NB.MClust(Simulated_Count,K=2:5)
cluster=m1$cluster #Estimated cluster assignment
k_hat=m1$K  #Estimated optimal K




