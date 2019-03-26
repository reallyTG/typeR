library(MendelianRandomization)


### Name: mr_mbe
### Title: Mode-based method of Hartwig
### Aliases: mr_mbe mr_mbe,MRInput-method

### ** Examples

mr_mbe(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse), iterations=100)
mr_mbe(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
   phi=0.5, iterations=100)
mr_mbe(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
   weighting="weighted", stderror="delta", iterations=100)
# iterations set to 100 to reduce computational time,
#  more iterations are recommended in practice




