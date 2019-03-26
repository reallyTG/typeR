library(QFASA)


### Name: p.QFASA
### Title: Computes the diet estimate for each predator in seal.mat using
###   either the Kullback-Leibler Distance (KL), the Aitchison Distance
###   (AIT) or the Chi-Square Distance (CS).
### Aliases: p.QFASA

### ** Examples

 ## Fatty Acids
 data(FAset)
 fa.set = as.vector(unlist(FAset))
 
 ## Predators
 data(predatorFAs)
 tombstone.info = predatorFAs[,1:4]
 predator.matrix = predatorFAs[,5:(ncol(predatorFAs))]
 npredators = nrow(predator.matrix)

 ## Prey
 data(preyFAs)
 prey.sub=(preyFAs[,4:(ncol(preyFAs))])[fa.set]
 prey.sub=prey.sub/apply(prey.sub,1,sum) 
 group=as.vector(preyFAs$Species)
 prey.matrix=cbind(group,prey.sub)
 prey.matrix=MEANmeth(prey.matrix) 

 FC = preyFAs[,c(2,3)] 
 FC = as.vector(tapply(FC$lipid,FC$Species,mean,na.rm=TRUE))

 ## Calibration Coefficients
 data(CC)
 cal.vec = CC[,2]
 cal.mat = replicate(npredators, cal.vec)

 # Run QFASA
 Q = p.QFASA(predator.matrix,
             prey.matrix,
             cal.mat,
             dist.meas=1, 
             gamma=1,
             FC,
             start.val = rep(1,nrow(prey.matrix)),
             fa.set)
 



