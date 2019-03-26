library(PresenceAbsence)


### Name: presence.absence.simulation
### Title: Presence/Absence Data Simulation
### Aliases: presence.absence.simulation
### Keywords: datagen

### ** Examples

### EXAMPLE 1 ###
### a graph illustrating effect of shape parameters on beta distribution

set.seed(666)
shapes<-c(1,2,5,10,20)
par(mfrow=c(5,5),mar=c(2,2,2,2),oma=c(0,3,3,0))

for(i in 1:5){
for(j in 1:5){
     SIMDATA<-presence.absence.simulation( n=1000,
                                           prevalence=1,
                                           N.models=1,
                                           shape1.absent=1,
                                           shape2.absent=1,
                                           shape1.present=shapes[i],
                                           shape2.present=shapes[j])
	#Note: by setting prevalence=1, all observed values will be 'present' 
	#	 therefore only one beta distribution will be simulated.	
	hist(SIMDATA[,3],breaks=50,main="",xlab="",ylab="",xlim=c(0,1))
	if(i==1){mtext(paste("shape2 =",shapes[j]),side=3,line=2,cex=.8)}
	if(j==1){mtext(paste("shape1 =",shapes[i]),side=2,line=3,cex=.8)}
}}

### EXAMPLE 2 ###
### generate observed data along with 3 sets of model predictions 
### for models of varying predictive ability.
### Note: This is the code used to generate sample dataset SIM3DATA.

set.seed(666)
SIM3DATA<-presence.absence.simulation(	n=1000,
							prevalence=.2,
							N.models=3,
							shape1.absent=c(1,1,1),
							shape2.absent=c(14,7,5), 
							shape1.present=c(6,2,1),
							shape2.present=c(2,2,2))



