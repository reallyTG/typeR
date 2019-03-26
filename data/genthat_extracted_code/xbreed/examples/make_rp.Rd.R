library(xbreed)


### Name: make_rp
### Title: Make recent population
### Aliases: make_rp

### ** Examples

# # # Simulation of a population where founders are from a population created by function sample_hp.

# CREATE HISTORICAL POPULATION

genome<-data.frame(matrix(NA, nrow=2, ncol=6))
names(genome)<-c("chr","len","nmrk","mpos","nqtl","qpos")
genome$chr<-c(1,2)
genome$len<-c(12,8)	
genome$nmrk<-c(140,80)
genome$mpos<-c("rnd","even")	
genome$nqtl<-c(25,25)
genome$qpos<-rep("rnd",2)	
genome

hp<-make_hp(hpsize=100
,ng=10,h2=0.3,phen_var=1
,genome=genome,mutr=5*10**-4,sel_seq_qtl=0.05,sel_seq_mrk=0.05,laf=0.5)

# # MAKE FIRST RECENT POPULATION USING FUNCTION sample_hp 

Male_founders<-data.frame(number=50,select='rnd') 
Female_founders<-data.frame(number=50,select='rnd')   

# Selection scheme in each generation of recent population 
Selection<-data.frame(matrix(NA, nrow=2, ncol=2))
names(Selection)<-c('Number','type')
Selection$Number[1:2]<-c(50,50)	
Selection$type[1:2]<-c('rnd','rnd')	
Selection

RP_1<-sample_hp(hp_out=hp,Male_founders=
Male_founders,Female_founders=Female_founders,
ng=4,Selection=Selection,Training=Training,
litter_size=3,Display=TRUE)

# # MAKE SECOND RP (RP2) USING FUNCTION make_hp 
  # Select founders 
  # Select 30 males based on 'tbv' from generation  2 of RP1. 
  # Select 40 females based on 'phen' from generation 4 of RP1. 

Males<-data.frame(number=30,generation=2,select='tbv',value='h')
Females<-data.frame(number=40,generation=4,select='phen',value='l')

# Selection scheme for RP2

# Selection of 20 sires and 50 dam			
# Selection criteria is "tbv" for sires and "phen" for dams

Selection<-data.frame(matrix(NA, nrow=2, ncol=3))
names(Selection)<-c('Number','type','Value')
Selection$Number[1:2]<-c(20,50)	
Selection$type[1:2]<-c('tbv','phen')	
Selection$Value[1:2]<-c('h','h') 
Selection

# Save "data" and "qtl" for first and last generation of RP1

rp2_output<-data.frame(matrix(NA, nrow=2, ncol=2))
names(rp2_output)<-c("data","qtl")
rp2_output[,1]<-c(1,4) # Save data for generations 1 and 4
rp2_output[,2]<-c(1,4) # Save qtl genotype for generations 1 and 4
rp2_output

RP_2<-make_rp(sh_out=RP_1,Male_founders=Males,
Female_founders=Females,Selection=Selection,
ng=4,litter_size=4,saveAt='RP2',
rp_output=rp2_output)

# Some output display

RP_2$summary_data
RP_2$output[[1]]$data # Data for base Generation
RP_2$output[[2]]$freqQTL # qtl frequencies for 1st Generation
RP_2$output[[4]]$freqMRK # Marker frequencies for 3rd Generation
RP_2$linkage_map_qtl
RP_2$allele_effcts



