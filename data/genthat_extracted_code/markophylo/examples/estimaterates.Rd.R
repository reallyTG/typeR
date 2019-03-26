library(markophylo)


### Name: estimaterates
### Title: Estimate substitution rate matrix.
### Aliases: estimaterates

### ** Examples

library(markophylo)
##############
data(simdata1) #example data for a 2-state continuous time markov chain model.
#Now, plot example tree.
ape::plot.phylo(simdata1$tree, edge.width = 2, show.tip.label = FALSE, no.margin = TRUE) 
ape::nodelabels(frame = "circle", cex = 0.7)
ape::tiplabels(frame = "circle", cex = 0.7)
print(simdata1$Q) #substitution matrix used to simulate example data
print(table(simdata1$data)) #states and frequencies
model1 <- estimaterates(usertree = simdata1$tree, userphyl = simdata1$data, 
                        alphabet = c(1, 2), rootprob = "equal", 
                        modelmat = matrix(c(NA, 1, 2, NA), 2, 2))
print(model1)
####
## No test: 
#If the data is known to contain sampling bias such that certain phyletic
#patterns are not observed, then these unobserved data can be corrected for
#easily. First, let's create a filtered version of the data following which
#a correction will be applied within the function. Here, any patterns with all
#ones or twos are filtered out.
filterall1 <- which(apply(simdata1$data, MARGIN = 1, FUN = 
                            function(x) isTRUE(all.equal(as.vector(x), c(1, 1, 1, 1)))))
filterall2 <- which(apply(simdata1$data, MARGIN = 1, FUN = 
                            function(x) isTRUE(all.equal(as.vector(x), c(2, 2, 2, 2)))))
filteredsimdata1 <- simdata1$data[-c(filterall1, filterall2), ]
model1_f_corrected <- estimaterates(usertree = simdata1$tree, userphyl = filteredsimdata1, 
                          unobserved = matrix(c(1, 1, 1, 1, 2, 2, 2, 2), nrow = 2,  byrow = TRUE), 
                          alphabet = c(1, 2), rootprob = "equal", 
                          modelmat = matrix(c(NA, 1, 2, NA), 2, 2))
print(model1_f_corrected)
##############
data(simdata2)
print(simdata2$Q)
#While simulating the data found in simdata2, the clade with node 7 as its
#most recent common ancestor (MRCA) was constrained to have twice the 
#substitution rates as the rest of the branches in the tree.
print(table(simdata2$data))
model2 <- estimaterates(usertree = simdata2$tree, userphyl = simdata2$data, 
                        alphabet = c(1, 2), bgtype = "ancestornodes", bg = c(7),
                        rootprob = "equal", modelmat = matrix(c(NA, 1, 2, NA), 2, 2))
print(model2)
plottree(model2, colors=c("blue", "darkgreen"), edge.width = 2, show.tip.label = FALSE, 
         no.margin = TRUE)
ape::nodelabels(frame = "circle", cex = 0.7)
ape::tiplabels(frame = "circle", cex = 0.7)
##############
#Nucleotide data was simulated such that the first half of sites followed
#substitution rates different from the other half of sites. Data was simulated
#in the two partitions with rates 0.33 and 0.99.
data(simdata3)
print(dim(simdata3$data))
print(table(simdata3$data))
model3 <- estimaterates(usertree = simdata3$tree, userphyl = simdata3$data, 
                        alphabet = c("a", "c", "g", "t"), rootprob = "equal", 
                        partition = list(c(1:2500), c(2501:5000)), 
                        modelmat = matrix(c(NA, 1, 1, 1, 1, NA, 1, 1, 
                                            1, 1, NA, 1, 1, 1, 1, NA), 4, 4))
print(model3)
## End(No test)
#More examples in the vignette.



