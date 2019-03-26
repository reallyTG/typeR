library(phylosim)


### Name: ContinuousInsertor
### Title: The ContinuousInsertor class
### Aliases: ContinuousInsertor

### ** Examples

       # create a ContinuousInsertor process
       o<-ContinuousInsertor(
               name="Conty",
               rate=0.1,
               dist=expression(1),
               max.length=2
       )
	# set template sequence
	o$templateSeq<-NucleotideSequence(string="CAC")
       # get object summary
       summary(o)
       # set/get length sampling expression
       o$dist<-expression(rnorm(1,mean=3,sd=3))
       o$dist
       # set/get maximum event length
       o$maxLength<-4
       o$maxLength
       # plot length density
       plot(o)
     
       # The following code illustrates how to use
       # a ContinuousInsertor process in a simulation
     
       # create a sequence object, attach process o
       s<-NucleotideSequence(string="AAAAAAAAAAGGGGAAAAAAAAAA",processes=list(list(o)))
       # set the insertion tolerance to zero in range 11:15
       # creating a region rejecting all insertions
       setInsertionTolerance(s,o,0,11:15)     
       # get insertion tolerances
       getInsertionTolerance(s,o)
       # create a simulation object
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # simulate
       Simulate(sim)
       # print resulting alignment
       sim$alignment
 


