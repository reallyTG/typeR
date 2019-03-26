library(xbreed)


### Name: calc_LD
### Title: Calculate linkage disequilibrium
### Aliases: calc_LD

### ** Examples

# Calculate mean r2 and LD decay.

genome<-data.frame(matrix(NA, nrow=1, ncol=6))
names(genome)<-c("chr","len","nmrk","mpos","nqtl","qpos")
genome$chr<-c(1)
genome$len<-c(100)	
genome$nmrk<-c(100)
genome$mpos<-c("rnd")	
genome$nqtl<-c(50)
genome$qpos<-c("even")	
genome

hp<-make_hp(hpsize=100,
ng=10,h2=0.3,phen_var=1 ,genome=genome,
mutr=2.5e-4)

# Mean r2

mat<-hp$hp_mrk[,-1]
rLD<-calc_LD(mat=mat,MAF=0.1,method='adjacent',LD_summary=TRUE)

# LD decay

 linkage_map<-hp$linkage_map_mrk[,3]
 rLD<-calc_LD(mat=mat,MAF=0.1,method='pairwise'
,LD_summary=TRUE,linkage_map=linkage_map,interval=5)

rLD$ld_decay



