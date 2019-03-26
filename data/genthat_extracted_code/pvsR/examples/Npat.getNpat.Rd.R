library(pvsR)


### Name: Npat.getNpat
### Title: Get a candidate's most recently filled out NPAT/PCT (Political
###   Courage Test)
### Aliases: Npat.getNpat

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get political courage tests of Barack Obama and John Sidney McCain III
## Not run: pcts <- Npat.getNpat(list(9490,53270))
## Not run: head(pcts$survey)
## Not run: head(pcts$candidate)



