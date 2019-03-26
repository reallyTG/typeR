## ----setup, include=FALSE, message=FALSE---------------------------------
library(knitr)
knitr::opts_chunk$set(echo = TRUE)

## ----libs,message=FALSE--------------------------------------------------
library(glmmTMB)
library(ggplot2); theme_set(theme_bw())

## ----fit1----------------------------------------------------------------
data(Owls)
owls_nb1 <- glmmTMB(SiblingNegotiation ~ FoodTreatment*SexParent +
                             (1|Nest)+offset(log(BroodSize)),
                          family = nbinom1,
                          ziformula = ~1, data=Owls)

## ----sim-----------------------------------------------------------------
simo=simulate(owls_nb1, seed=1)
Simdat=Owls
Simdat$SiblingNegotiation=simo[[1]]
Simdat=transform(Simdat,  
			NegPerChick = SiblingNegotiation/BroodSize, 
			type="simulated")
Owls$type = "observed"	
Dat=rbind(Owls, Simdat)	

## ----plots,fig.width=7---------------------------------------------------

ggplot(Dat,  aes(NegPerChick, colour=type))+geom_density()+facet_grid(FoodTreatment~SexParent)

