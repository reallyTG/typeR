library(mclust)


### Name: clustCombi
### Title: Combining Gaussian Mixture Components for Clustering
### Aliases: clustCombi print.clustCombi summary.clustCombi
###   print.summary.clustCombi
### Keywords: cluster

### ** Examples

data(Baudry_etal_2010_JCGS_examples)

# run Mclust using provided data
output <- clustCombi(data = ex4.1) 
## Not run: 
##D # or run Mclust and then clustcombi on the returned object
##D mod <- Mclust(ex4.1)
##D output <- clustCombi(mod)
## End(Not run)

output
summary(output)

## Not run: 
##D # run Mclust using provided data and any further optional argument provided
##D output <- clustCombi(data = ex4.1, modelName = "EEV", G = 1:15)
## End(Not run)

# plot the hierarchy of combined solutions
plot(output, what = "classification") 
# plot some "entropy plots" which may help one to select the number of classes
plot(output, what = "entropy") 
# plot the tree structure obtained from combining mixture components
plot(output, what = "tree") 

# the selected model and number of components obtained from Mclust using BIC
output$MclustOutput 

# the matrix whose [i,k]th entry is the probability that i-th observation in 
# the data belongs to the k-th class according to the BIC solution
head( output$combiz[[output$MclustOutput$G]] ) 
# the matrix whose [i,k]th entry is the probability that i-th observation in 
# the data belongs to the k-th class according to the first combined solution
head( output$combiz[[output$MclustOutput$G-1]] ) 
# the matrix describing how to merge the 6-classes solution to get the 
# 5-classes solution
output$combiM[[5]] 
# for example the following code returns the label of the class (in the 
# 5-classes combined solution) to which the 4th class (in the 6-classes
# solution) is assigned. Only two classes in the (K+1)-classes solution 
# are assigned the same class in the K-classes solution: the two which 
# are merged at this step... 
output$combiM[[5]] 
# recover the 5-classes soft clustering from the 6-classes soft clustering 
# and the 6 -> 5 combining matrix
all( output$combiz[[5]] == t( output$combiM[[5]] %*% t(output$combiz[[6]]) ) ) 
# the hard clustering under the 5-classes solution
head( output$classification[[5]] )



