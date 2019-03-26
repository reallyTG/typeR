library(paleotree)


### Name: termTaxa
### Title: Simulating Extinct Clades of Monophyletic Taxa
### Aliases: termTaxa simTermTaxa candleTaxa simCandleTaxa trueCandle
###   simTermTaxaAdvanced trueTermTaxaTree deadTree simTermTaxaAdvanced
###   trueTermTaxaTree deadTree

### ** Examples


set.seed(444)
#example for 20 taxa
termTaxaRes <- simTermTaxa(20)

#let look at the taxa...
taxa <- termTaxaRes$taxonRanges
taxicDivCont(taxa)
#because ancestors don't even exist as taxa
	#the true diversity curve can go to zero
	#kinda bizarre!

#the tree should give a better idea
tree <- termTaxaRes$tree
phyloDiv(tree)
#well, okay, its a tree. 

#get the 'ideal cladogram' ala taxa2cladogram
    #much easier with terminal-taxa simulations as no paraphyletic taxa
cladogram <- tree
cladogram$edge.length <- NULL
plot(cladogram)

#trying out trueTermTaxaTree
#random times of observation: uniform distribution
time.obs <- apply(taxa,1,function(x) runif(1,x[2],x[1]))
tree1 <- trueTermTaxaTree(termTaxaRes,time.obs)
layout(1:2)
plot(tree)
plot(tree1)

layout(1)

#let's look at the change in the terminal branches
plot(tree$edge.length,tree1$edge.length)
#can see some edges are shorter on the new tree, cool

#let's now simulate sampling and use FADs
layout(1:2)
plot(tree);axisPhylo()
FADs <- sampleRanges(termTaxaRes$taxonRanges,r = 0.1)[,1]
tree1 <- trueTermTaxaTree(termTaxaRes,FADs)
plot(tree1);axisPhylo()

#can condition on sampling some average number of taxa
#analogous to deprecated function simFossilTaxa_SRcond
r <- 0.1
avgtaxa <- 50
sumRate <- 0.2
#avg number necc for an avg number sampled
ntaxa_orig <- avgtaxa/(r/(r+sumRate))	
termTaxaRes <- simTermTaxa(ntaxa = ntaxa_orig,sumRate = sumRate)
#note that conditioning must be conducted using full sumRate
#this is because durations are functions of both rates
#just like in bifurcation

#use advanced version of simTermTaxa: simTermTaxaAdvanced
    #allows for extant taxa in a term-taxa simulation

#with min.cond
termTaxaRes <- simTermTaxaAdvanced(p = 0.1,q = 0.1,mintaxa = 50,
    maxtaxa = 100,maxtime = 100,minExtant = 10,maxExtant = 20,min.cond = TRUE)
#notice that arguments are similar to simFossilRecord
	# and somewhat more similar to deprecated function simFossilTaxa ;P
plot(termTaxaRes$tree)
Ntip(termTaxaRes$tree)

#without min.cond
termTaxaRes <- simTermTaxaAdvanced(p = 0.1,q = 0.1,mintaxa = 50,
    maxtaxa = 100,maxtime = 100,minExtant = 10,maxExtant = 20,min.cond = FALSE)
plot(termTaxaRes$tree)
Ntip(termTaxaRes$tree)

layout(1)




