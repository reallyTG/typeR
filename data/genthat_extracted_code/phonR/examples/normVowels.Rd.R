library(phonR)


### Name: Normalize vowel formant frequencies
### Title: Normalize formant frequency values using a variety of algorithms
### Aliases: normVowels normBark normErb normLobanov normLog normLogmean
###   normMel normNearey1 normNearey2 normSharedLogmean normWattFabricius
### Keywords: methods

### ** Examples

    data(indoVowels)
    bark <- with(indo, normBark(cbind(f1, f2)))
    erbn <- with(indo, normErb(cbind(f1, f2)))
    mel <- with(indo, normMel(cbind(f1, f2)))
    lobanov <- with(indo, normLobanov(cbind(f1, f2), group=subj))
    lognormed <- with(indo, normLog(cbind(f1, f2)))
    # using the convenience wrapper:
    bark <- with(indo, normVowels('bark', f1=f1, f2=f2))
    wattfab <- with(indo, normVowels('wattfabricius', f1=f1, f2=f2,
                    vowel=vowel, group=subj))



