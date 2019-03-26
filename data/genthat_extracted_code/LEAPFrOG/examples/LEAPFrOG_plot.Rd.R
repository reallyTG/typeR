library(LEAPFrOG)


### Name: LEAPFrOG_plot
### Title: LEAPFrOG plotting function
### Aliases: LEAPFrOG_plot

### ** Examples

#Example with nonsense data -
#10000 random SNP genotypes 
#...and uniform, random allele frequencies from two populations.
library(LEAPFrOG)
#Get LEAPFrOG parameter estimates  for 10 simulated individuals
Results=array(dim=c(3,2,10))
for(i in 1:10){
z1=LEAPFrOG(sample(0:2,10000,replace=TRUE),cbind(runif(10000,0,1),runif(10000,0,1)))
Results[1,,i]=z1$m    #Offspring 
Results[2,,i]=z1$P1 #Parent 'A'
Results[3,,i]=z1$P2 #Parent 'B
}
#Now plot these 10 individuals
LEAPFrOG_plot(Results,PopNames=c("PopA","PopB"))
#With sample names:
names=c("Hair","Blood","Door Handle","Ballroom","Lead Piping")
names=c(names,"Briefcase","Toothbrush","Sock","Shirt","Skin")
LEAPFrOG_plot(Results,PopNames=c("PopA","PopB"),SampNames=names)



