library(phylosim)


### Name: ContinuousDeletor
### Title: The ContinuousDeletor class
### Aliases: ContinuousDeletor

### ** Examples

 	# create a ContinuousDeletor process
       o<-ContinuousDeletor(
               name="Conty",
               rate=0.25,
		dist=expression(1),
		max.length=2
       )
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
       # a ContinuousDeletor process in a simulation
     
       # create a sequence object, attach process o
       s<-NucleotideSequence(string="AAAAAAAAAAGGGGAAAAAAAAAA",processes=list(list(o)))
       # set the deletion tolerance to zero in range 11:15
       # creating a region rejecting all deletions
       setDeletionTolerance(s,o,0,11:15)     
       # get deletion tolerances
       getDeletionTolerance(s,o)
       # create a simulation object
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # simulate
       Simulate(sim)
       # print resulting alignment
       sim$alignment
 


