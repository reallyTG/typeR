library(pvsR)


### Name: CandidateBio.getDetailedBio
### Title: Get a candidate's detailed biographical information
### Aliases: CandidateBio.getDetailedBio

### ** Examples

# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
## Not run: pvs.key <- "yourkey"
# get main biographical data on Barack Obama and Mitt Romney
## Not run: bio <- CandidateBio.getDetailedBio(list(9490,21942))
## Not run: head(bio$profession)
## Not run: head(bio$orgMembership)



