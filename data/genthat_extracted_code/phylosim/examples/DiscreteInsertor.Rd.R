library(phylosim)


### Name: DiscreteInsertor
### Title: The DiscreteInsertor class
### Aliases: DiscreteInsertor

### ** Examples

       # create a DiscreteInsertor process
       i<-DiscreteInsertor(
               name="Mii",
               rate=0.25,
               sizes=c(1,2),
               probs=c(1/2,1/2)
       )
	# set template sequence
	i$templateSeq<-NucleotideSequence(string="C")
       # get object summary
       summary(i)
       # set/get insertion sizes
       i$sizes<-1:3
	i$sizes
       # set/get length probabilities
       i$probs<-c(3,2,1)/6
       i$probs
       # plot length distribution
       plot(i)
     
       # The following code illustrates how to use
       # a DiscreteInsertor process in a simulation
     
       # create a sequence object and attach process i to it
       s<-NucleotideSequence(string="AAAAAAAAAAGGGGAAAAAAAAAA",processes=list(list(i)))
       # set the insertion tolerance to zero in range 11:15
       # creating a region rejecting all insertions
       setInsertionTolerance(s,i,0,11:15)     
       # get insertion tolerances
       getInsertionTolerance(s,i)
       # create a simulation object
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # simulate
       Simulate(sim)
       # print resulting alignment
       sim$alignment
 


