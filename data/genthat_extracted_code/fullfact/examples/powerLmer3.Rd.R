library(fullfact)


### Name: powerLmer3
### Title: Power analysis for normal data 3
### Aliases: powerLmer3

### ** Examples

##design object: 2 remaining random effects and 1 continous fixed effect
block=c(2,2); blocN=10; position=2; posN=10; offN=20
dam0<- stack(as.data.frame(matrix(1:(block[1]*blocN),ncol=blocN,nrow=block[1])))
sire0<- stack(as.data.frame(matrix(1:(block[2]*blocN),ncol=blocN,nrow=block[2])))
observ0<- merge(dam0,sire0, by="ind")
levels(observ0[,1])<- 1:blocN; colnames(observ0)<- c("block","dam","sire")
observ0$family<- 1:nrow(observ0)  #add family
#expand for position
observ1<- do.call("rbind", replicate(position,observ0,simplify=FALSE));rm(observ0)
observ1$position<- sample(rep(1:posN,each=position)) #random assignment
#expand for offspring
observ<- do.call("rbind", replicate(offN,observ1,simplify=FALSE)); rm(observ1)
desn<- observ[,c(2,3,4,5,1)];rm(observ) #dam,sire,family,position,block
desn$egg_size<- 1:nrow(desn)
colnames(desn)[6]<- "egg_size"

#100 simulations
## Not run: 
##D pwr_L3<- powerLmer3(var_rand=c(0.19,0.03,0.02,0.51,0.1,0.05),
##D n_rand=c(20,20,40,10,10),var_fix=0.1,n_fix=1,design=desn,remain="(1|position)+
##D (1|block)+egg_size")
##D pwr_L3
## End(Not run)



