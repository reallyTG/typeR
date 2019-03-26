library(textshape)


### Name: split_speaker
### Title: Break and Stretch if Multiple Persons per Cell
### Aliases: split_speaker

### ** Examples

## Not run: 
##D DATA$person <- as.character(DATA$person)
##D DATA$person[c(1, 4, 6)] <- c("greg, sally, & sam",
##D     "greg, sally", "sam and sally")
##D 
##D split_speaker(DATA)
##D 
##D DATA$person[c(1, 4, 6)] <- c("greg_sally_sam",
##D     "greg.sally", "sam; sally")
##D 
##D split_speaker(DATA, sep = c(".", "_", ";"))
##D 
##D DATA <- textshape::DATA  #reset DATA
## End(Not run)



