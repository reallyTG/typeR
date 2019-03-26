library(SoilR)


### Name: GaudinskiModel14
### Title: Implementation of a the six-pool C14 model proposed by Gaudinski
###   et al. 2000
### Aliases: GaudinskiModel14

### ** Examples

 
 years=seq(1901,2010,by=0.5)
 
 Ex=GaudinskiModel14(
   t=years,
   ks=c(kr=1/3, koi=1/1.5, koeal=1/4, koeah=1/80, kA1=1/3, kA2=1/75, kM=1/110),
   inputFc=C14Atm_NH
 )
 R14m=getF14R(Ex)
 C14m=getF14C(Ex)
     
 plot(
   C14Atm_NH,
   type="l",
   xlab="Year",
   ylab=expression(paste(Delta^14,"C ","(\u2030)")),
   xlim=c(1940,2010)
 ) 
 lines(years,C14m,col=4)
 points(HarvardForest14CO2[1:11,1],HarvardForest14CO2[1:11,2],pch=19,cex=0.5)
 points(HarvardForest14CO2[12:173,1],HarvardForest14CO2[12:173,2],pch=19,col=2,cex=0.5)
 points(HarvardForest14CO2[158,1],HarvardForest14CO2[158,2],pch=19,cex=0.5)
 lines(years,R14m,col=2)
 legend(
   "topright",
   c("Delta 14C Atmosphere",
      "Delta 14C SOM", 
      "Delta 14C Respired"
   ),
   lty=c(1,1,1), 
   col=c(1,4,2),
   bty="n"
 )
 ## We now show how to bypass soilR s parameter sanity check if nacessary 
 ## (e.g in for parameter estimation ) in functions
 ## wchich might call it with unreasonable parameters
 years=seq(1800,2010,by=0.5)
 Ex=GaudinskiModel14(
   t=years,
   ks=c(kr=1/3,koi=1/1.5,koeal=1/4,koeah=1/80,kA1=1/3,kA2=1/75,kM=1/110),
   inputFc=C14Atm_NH,
   pass=TRUE
)



