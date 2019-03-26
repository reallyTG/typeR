library(seedy)


### Name: transroutes
### Title: Assessment of transmission routes using theoretical SNP
###   distribution
### Aliases: transroutes

### ** Examples


  data(transmission)
  W <- transmission
  ID <- unique(W$sampledata[,1])
  GD <- gd(W$sampledata[,3], W$libr, W$nuc, W$librstrains)
  
  sample.times <- W$sampledata[,2]
  inf.times <- numeric(length(ID))
  rec.times <- numeric(length(ID))
  truesource <- numeric(length(ID))
  for (i in 1:length(ID)) {
    inf.times[i] <- W$epidata[which(W$epidata[,1]==ID[i]),2]
    rec.times[i] <- W$epidata[which(W$epidata[,1]==ID[i]),3]
    truesource[i] <- W$epidata[which(W$epidata[,1]==ID[i]),4]
  }
  
  K <- transroutes(ID=ID, GD=GD, sample.times=sample.times, inf.times=inf.times, 
                   rec.times=rec.times, mut.rate=0.01, eq.size=5000, 
                   bottle.size=1, p.level=0.95, summary=TRUE)
  truesource
  K$maxpostsource




