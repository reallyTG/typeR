library(flip)


### Name: flipMix
### Title: The main function for testing mixed models under a permutation
###   (and rotation) framework
### Aliases: flipMix flipMixWithin obs2coeffWithin
### Keywords: htest

### ** Examples


N=10
toyData= data.frame(subj=rep(1:N,rep(4,N)), Within=rep(1:2,N*2),
          XBetween= rep(1:2,rep(N/2*4,2)),ZBetween= rep(rnorm(N/2),rep(8,N/2)))
toyData= cbind(Y1=rnorm(n=N*4,mean=toyData$subj+toyData$ZBetween+toyData$XBetween),
               Y2=rnorm(n=N*4,mean=toyData$subj+toyData$ZBetween+toyData$Within*2),toyData)
(toyData)

#####################
###Testing Between-unit effects
(res=flipMix(modelWithin=as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData, 
      X=~XBetween,Z=~ZBetween,units=~subj,perms=1000,testType="permutation",statTest="t"))
#same as:
modelWithin <- lm(as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData)
(flipMix(modelWithin=modelWithin,data=toyData, X=~XBetween,Z=~ZBetween,units= ~subj, 
        perms=1000,testType="permutation",statTest="t"))

### Note that this is different from:
modelWithin <- list(Y1=lm(Y1~Within,data=toyData),Y2=lm(Y2~Within,data=toyData))
(flipMix(modelWithin=modelWithin,data=toyData, X=~XBetween,Z=~ZBetween,units= ~subj,
        perms=1000,testType="permutation",statTest="t"))

### combining results
(npc(res,"data.pc"))
(npc(res,"data.trace"))
################################
###Testing Within-unit effects
## The resulting test is approximated. The estimate of the variance within units 
## takes in account the presence of effects between units.
(flipMix(modelWithin=as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData, 
        units= ~subj, perms=1000,testType="permutation",statTest="t"))

###The resulting tests are exact. If effects between are presents, 
## statTest="Tnaive" or "TBTWest" are more suitable:
(res=flipMixWithin(modelWithin=as.matrix(toyData[,c("Y1","Y2")])~Within,data=toyData, 
        units= ~subj, perms=1000,statTest=c("TH1est")))
npc(res)




