library(emuR)


### Name: emuR-package
### Title: emuR - Main Package of the EMU Speech Database Management System
### Aliases: emuR-package emuR
### Keywords: package

### ** Examples

## Not run: 
##D # create demo data including an emuDB called "ae" 
##D create_emuRdemoData(dir = tempdir())
##D 
##D # construct path to demo emuDB
##D path2ae = file.path(tempdir(), "emuR_demoData", "ae")
##D 
##D # load emuDB into current R session
##D ae = load_emuDB(path2ae)
##D 
##D # query loaded emuDB
##D lvowels = query(ae, "Phonetic = i: | u: | o:")
##D 
##D # extract labels from query result 
##D lvowels.labs = label(lvowels)
##D 
##D # list all ssffTrackDefinitions of emuDB
##D list_ssffTrackDefinitions(ae)
##D 
##D # get formant trackdata defined in ssffTrackDefinitions "fm" for query result
##D lvowels.fm = get_trackdata(ae, lvowels, "fm")
##D 
##D # extract track values at temporal midpoint of segments
##D lvowels.fmCut = dcut(lvowels.fm, .5, prop = TRUE)
##D 
##D # Plot the data as time signal and formant card
##D dplot(lvowels.fm[,1:2], lvowels.labs, normalise=TRUE, main = "Formants over vowel duration")
##D eplot(lvowels.fmCut[,1:2], lvowels.labs, dopoints=TRUE, 
##D       doellipse=FALSE, main = "F1/F2 of vowel midpoint", form=TRUE, 
##D       xlab = "F2 in Hz", ylab = "F1 in Hz")
##D       
##D       
##D # Plot of spectral data from 50% of aspiration duration
##D hs = query(ae,"Phonetic = H")
##D hs.labs = label(hs)
##D hs.dft = get_trackdata(ae, hs, "dft")
##D hs.dftCut = dcut(hs.dft, .5, prop=TRUE)
##D plot(hs.dftCut, hs.labs, main = "Spectral data of aspiration")
##D 
## End(Not run)




