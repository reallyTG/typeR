library(rPraat)


### Name: formant.cut0
### Title: formant.cut0
### Aliases: formant.cut0

### ** Examples

formant <- formant.sample()
formant2 <-   formant.cut(formant,  tStart = 3)
formant2_0 <- formant.cut0(formant, tStart = 3)
formant3 <-   formant.cut(formant,  tStart = 2, tEnd = 3)
formant3_0 <- formant.cut0(formant, tStart = 2, tEnd = 3)
formant4 <-   formant.cut(formant,  tEnd = 1)
formant4_0 <- formant.cut0(formant, tEnd = 1)
formant5 <-   formant.cut(formant,  tStart = -1, tEnd = 1)
formant5_0 <- formant.cut0(formant, tStart = -1, tEnd = 1)
## Not run: 
##D formant.plot(formant)
##D formant.plot(formant2)
##D formant.plot(formant2_0)
##D formant.plot(formant3)
##D formant.plot(formant3_0)
##D formant.plot(formant4)
##D formant.plot(formant4_0)
##D formant.plot(formant5)
##D formant.plot(formant5_0)
## End(Not run)



