library(xbreed)


### Name: make_hp
### Title: Create historical population
### Aliases: make_hp

### ** Examples

# # # EXAMPLE 1 Simulation of a historical population 
#for an additive trait (h2=0.3) for 10 generations.
# Two  chromosome with different parameters

genome<-data.frame(matrix(NA, nrow=2, ncol=6))
names(genome)<-c("chr","len","nmrk","mpos","nqtl","qpos")
genome$chr<-c(1,2)
genome$len<-c(100,200)	
genome$nmrk<-c(100,100)
genome$mpos<-c("rnd","even")	
genome$nqtl<-c(50,50)
genome$qpos<-c("even","rnd")	
genome

hp<-make_hp(hpsize=100,
 ng=10,h2=0.3,phen_var=1 ,genome=genome,
 mutr=2.5e-4,saveAt="hp1")

head(hp$hp_data)
head(hp$freqQTL)
head(hp$linkage_map_qtl_mrk)


# # # EXAMPLE 2 Simulation of a historical population for a trait with both additive and
# dominance effects (h2=0.3, d2=0.1). 
# All loci will have the same allele frequencies in the first generation. 
# Segregating markers and qtl with MAF>0.1 will be selected in the last historical population.

genome<-data.frame(matrix(NA, nrow=3, ncol=6))
names(genome)<-c("chr","len","nmrk","mpos","nqtl","qpos")
genome$chr<-c(1,2,3)
genome$len<-c(12,8,11)	
genome$nmrk<-c(140,80,73)
genome$mpos<-c("rnd","even","even")	
genome$nqtl<-c(40,65,24)
genome$qpos<-rep("rnd",3)	
genome

hp2<-make_hp(hpsize=100,
  ng=10,h2=0.3,d2=0.1,phen_var=1 ,genome=genome,
  mutr=2.5e-4,sel_seq_qtl=0.1,sel_seq_mrk=0.1,
  laf=0.1,saveAt="hp2")

head(hp2$hp_data)
head(hp2$freqQTL)
head(hp2$linkage_map_qtl_mrk)



