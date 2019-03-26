library(qdap)


### Name: speakerSplit
### Title: Break and Stretch if Multiple Persons per Cell
### Aliases: speakerSplit

### ** Examples

## Not run: 
##D DATA$person <- as.character(DATA$person)
##D DATA$person[c(1, 4, 6)] <- c("greg, sally, & sam", 
##D     "greg, sally", "sam and sally")
##D 
##D speakerSplit(DATA)
##D speakerSplit(DATA, track.reps=TRUE)
##D 
##D DATA$person[c(1, 4, 6)] <- c("greg_sally_sam", 
##D     "greg.sally", "sam; sally")
##D 
##D speakerSplit(DATA, sep = c(".", "_", ";"))
##D 
##D DATA <- qdap::DATA  #reset DATA
## End(Not run)



