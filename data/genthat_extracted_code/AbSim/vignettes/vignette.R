## ---- fig.show='hold'----------------------------------------------------
single.lineage.test <- AbSim::singleLineage(max.seq.num=20,max.timer=150,SHM.method="naive",baseline.mut = 0.0008,SHM.branch.prob = "identical", SHM.branch.param = 0.05, SHM.nuc.prob = 15/350,species="mus", max.VDJ = 3, VDJ.branch.prob = 0.3,proportion.sampled = 1,sample.time = 30, chain.type="heavy",vdj.model="naive", vdj.insertion.mean=4,vdj.insertion.stdv=2)

## ---- fig.show='hold'----------------------------------------------------
head(substring(single.lineage.test[[1]][[1]],first=1,last=20))

# Note that these sequences are just showing the first 20 nucleotides (although the full nucleotide sequence is much longer)


## ---- fig.show='hold'----------------------------------------------------

head(single.lineage.test[[2]][[1]])

# Thus, the sequences and the names can be paired by looking at the corresponding elements in the nested list. E.G single.lineage.test[[1]][[1]][1] corresponds to the sequence of single.lineage.test[[2]][[1]][1]. (In this case it represents the germline)


single.lineage.test[[2]][[1]][3] 


## ---- fig.show='hold'----------------------------------------------------

plot(single.lineage.test[[3]][[1]],cex=.5)
title(single.lineage.test[[2]][[1]][1])



## ---- fig.show='hold'----------------------------------------------------


head(substring(single.lineage.test[[4]],first=1,last=20)) # Shows the sequences of the first sampling time point
head(single.lineage.test[[5]]) # Names corresponding to above sequences at same time point




## ---- fig.show='hold'----------------------------------------------------

full.repertoire.test <- AbSim::fullRepertoire(max.seq.num=30, max.timer=150, SHM.method="naive", baseline.mut = 0.0008, SHM.branch.prob = "identical", SHM.branch.param = 0.1, SHM.nuc.prob = 15/350, species="mus", VDJ.branch.prob = 0.8, proportion.sampled = 1, sample.time = 15,max.tree.num = 3, chain.type="heavy",vdj.model="naive", vdj.insertion.mean=4,vdj.insertion.stdv=2)



## ---- fig.show='hold'----------------------------------------------------
head(substring(full.repertoire.test[[1]][[1]],first=1,last=20)) # Sequences corresponding to first tree

head(substring(full.repertoire.test[[1]][[2]],first=1,last=20)) # Sequences corresponding to second tree

# Note that these sequences are just showing the first 20 nucleotides (although the full nucleotide sequence is much longer)


## ---- fig.show='hold'----------------------------------------------------
head(full.repertoire.test[[2]][[1]]) # The names corresponding to sequences found in the first tree 

head(full.repertoire.test[[2]][[2]]) # The names corresponding to the sequences found in the second tree

# The tree containing the sequences/names would be full.repertoire.test[[3]][[1]] and full.repertoire.test[[3]][[2]], respectively



## ---- fig.show='hold'----------------------------------------------------

plot(full.repertoire.test[[3]][[1]],cex=.5) # This shows the first simulated tree
title(full.repertoire.test[[2]][[2]][1]) # makes the germline sequence name the title

plot(full.repertoire.test[[3]][[2]],cex=.5) # This shows the second simulated tree
title(full.repertoire.test[[2]][[2]][1])

plot(full.repertoire.test[[3]][[3]],cex=.5) # This shows the third simulated tree
title(full.repertoire.test[[2]][[2]][1])
# Other phylogenetic tree properties (e.g., tip names) can be accessed by:
head(full.repertoire.test[[3]][[1]]$tip.label)


## ---- fig.show='hold'----------------------------------------------------


head(substring(full.repertoire.test[[4]][[2]],first=1,last=20)) # intermediate sequences at time point 20 for the second tree

head(full.repertoire.test[[5]][[2]]) # names of the intermediate sequences at time point 20  


## ---- fig.show='hold'----------------------------------------------------

# full.repertoire.test has 30 sequences to start. Will expand the repertoire by 3 with the following function
expanded.test <- AbSim::clonalExpansion(ab.repertoire = full.repertoire.test,
                                        rep.size = 90,
                                        distribution = "id",
                                        with.germline = FALSE)
length(expanded.test[[1]]) # expected 90 sequences


## ---- fig.show='hold'----------------------------------------------------

only.sequences <- unlist(full.repertoire.test[[1]])
head(substring(only.sequences,first=1,last=20))
# shows the first 20 nucleotides of each sequence composing the repertoire (no frequencies yet, see clonal expansion)
print(single.lineage.test[[3]][[1]]$tip.label[1]) # extracts the germline V,D,J genes used


## ---- fig.show='hold'----------------------------------------------------

tree.without.germline <- ape::drop.tip(single.lineage.test[[3]][[1]],tip=1)


