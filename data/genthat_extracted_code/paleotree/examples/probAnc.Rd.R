library(paleotree)


### Name: probAnc
### Title: Probability of being a sampled ancestor of another sampled taxon
### Aliases: probAnc

### ** Examples

#examples, run at very low nrep for sake of speed (examples need to be fast)

#default: probability of sampling a direct descendant
probAnc(p = 0.1, q = 0.1, R = 0.5, 
   mode = "budding", analysis = "directDesc",nrep = 100)

#other modes
probAnc(p = 0.1, q = 0.1, R = 0.5, 
   mode = "bifurcating", analysis = "directDesc",nrep = 100)
probAnc(p = 0.1, q = 0.1, R = 0.5, 
   mode = "anagenesis", analysis = "directDesc",nrep = 100)

#probability of having sampled indirect descendants of a taxon
probAnc(p = 0.1, q = 0.1, R = 0.5, 
   mode = "budding", analysis = "indirectDesc",nrep = 100)	#default
probAnc(p = 0.1, q = 0.1, R = 0.5, 
   mode = "bifurcating", analysis = "indirectDesc",nrep = 100)
probAnc(p = 0.1, q = 0.1, R = 0.5, 
   mode = "anagenesis", analysis = "indirectDesc",nrep = 100)




