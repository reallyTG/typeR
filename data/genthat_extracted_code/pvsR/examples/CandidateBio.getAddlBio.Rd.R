library(pvsR)


### Name: CandidateBio.getAddlBio
### Title: Get a candidate's additional biographical information
### Aliases: CandidateBio.getAddlBio

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get additional biographical data on Barack Obama
## Not run: obama <- CandidateBio.getAddlBio(9490)
## Not run: obama
# get additional biographical data on Barack Obama and Mitt Romney
## Not run: onr <- CandidateBio.getAddlBio(list(9490,21942))
## Not run: onr



