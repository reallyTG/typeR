library(phylosim)


### Name: BinarySubst
### Title: The BinarySubst class
### Aliases: BinarySubst

### ** Examples

 	# The following code demonstrates
       # the use of the BinarySubst process  
       # during a simulation.
       p<-BinarySubst(rate=0.25,name="Binary",rate.list=list("0->1"=2,"1->0"=1))
       # create a sequence object, attach process p
       s<-BinarySequence(string="000000000000000000",processes=list(list(p)));
       # make the first five positions invariable
       setRateMultipliers(s,p,0,1:5)
       # get rate multipliers
       getRateMultipliers(s,p)
       # simulate
       sim<-PhyloSim(root.seq=s,phylo=rcoal(3))
       Simulate(sim)
       # print alignment
       sim$alignment
 


