library(xbreed)


### Name: sample_hp
### Title: Sample from historical population
### Aliases: sample_hp

### ** Examples

# # # Simulation of a recent population following a historical population. 

# CREATE HISTORICAL POPULATION

genome<-data.frame(matrix(NA, nrow=2, ncol=6))
names(genome)<-c("chr","len","nmrk","mpos","nqtl","qpos")
genome$chr<-c(1,2)
genome$len<-c(50,60)	
genome$nmrk<-c(130,75)
genome$mpos<-c("rnd","rnd")	
genome$nqtl<-c(30,30)
genome$qpos<-rep("even",2)	
genome

hp<-make_hp(hpsize=100
,ng=10,h2=0.3,d2=0.15,phen_var=1
,genome=genome,mutr=5*10**-4,sel_seq_qtl=0.05,sel_seq_mrk=0.05,laf=0.5)

# # MAKE FIRST RECENT POPULATION USING FUNCTION sample_hp 

Male_founders<-data.frame(number=50,select="rnd") 
Female_founders<-data.frame(number=50,select="rnd")   

# Selection scheme in each generation of recent population 

Selection<-data.frame(matrix(NA, nrow=2, ncol=2))
names(Selection)<-c("Number","type")
Selection$Number[1:2]<-c(50,50)	
Selection$type[1:2]<-c("rnd","rnd")	
Selection

# Save "data" and "freq_mrk" for first and last generation of RP

my_files<-data.frame(matrix(NA, nrow=2, ncol=2))
names(my_files)<-c("data","marker")
my_files[,1]<-c(1,4) # Save data for generations 1 and 4
my_files[,2]<-c(1,4) # Save freq_mrk for generations 1 and 4
my_files

RP<-sample_hp(hp_out=hp,Male_founders=
Male_founders,Female_founders=Female_founders,
ng=4,Selection=Selection,litter_size=3,saveAt="my_RP",sh_output=my_files,Display=TRUE)

# Some results 

RP$summary_data
RP$output[[2]]$data      # Data for 1st Generation
RP$output[[4]]$freqMRK   # Marker frequencies for 3rd Generation
RP$linkage_map_qtl
RP$allele_effcts



