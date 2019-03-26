library(protViz)


### Name: iRTpeptides
### Title: iRT peptides - independent retention time peptides
### Aliases: iRTpeptides irt iRT

### ** Examples


    plot(sort(iRTpeptides$rt))

    plot(pim<-parentIonMass(as.character(iRTpeptides$peptide)) ~ iRTpeptides$rt)




