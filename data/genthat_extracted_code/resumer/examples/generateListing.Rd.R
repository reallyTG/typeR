library(resumer)


### Name: generateListing
### Title: generateListing
### Aliases: generateListing

### ** Examples

library(dplyr)
oneJob <- jobs %>% filter(JobName=='Pied Piper', Company=='Tech Central')
generateListing(oneJob)
generateListing(oneJob, bullets=c(1, 3))

oneResearch <- jobs %>% filter(JobName=='Oddie Research', Company=='Hudson University')
generateListing(oneResearch, bullets=4, type='Research')
generateListing(oneResearch, bullets=4:5, type='Research')




