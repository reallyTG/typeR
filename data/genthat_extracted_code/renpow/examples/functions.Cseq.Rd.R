library(renpow)


### Name: sequestration
### Title: Carbon Sequestration
### Aliases: Cseq forest.seq
### Keywords: hplot dplot math

### ** Examples


forest <- list(t=seq(0,100),B0=1,Bmax=150,nu=0.5,r=0.3)
plant <- list(kgCO2.kWh=0.4,P=10^9,C=1.0) 
forest.seq(x=forest,y=plant)




