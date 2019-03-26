library(protViz)


### Name: Fasta
### Title: FASTA format reader
### Aliases: FASTA Fasta fasta
### Keywords: FASTA AA

### ** Examples

# >sp|P12763|FETUA_BOVIN Alpha-2-HS-glycoprotein OS=Bos taurus
  fname <- system.file("extdata", name='P12763.fasta', package = "protViz")
  F <- Fasta$new(fname)
  F
  F$summary()
  F$getTrypticPeptides()
  
  plot(parentIonMass(F$getTrypticPeptides()), ssrc(F$getTrypticPeptides()),
    log='xy')
  text(parentIonMass(F$getTrypticPeptides()), ssrc(F$getTrypticPeptides()), 
    F$getTrypticPeptides(), pos=3, cex=0.5)




