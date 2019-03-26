library(congressbr)


### Name: sen_votes
### Title: Returns voting information from the Senate floor for the date
###   requested
### Aliases: sen_votes

### ** Examples

## Not run: 
##D en_votes(date = "20130516")
##D 
##D # Some votes are secret:
##D ssshhh <- sen_votes("20160301", binary = FALSE)
##D 
##D # All votes between two periods (might take a little while):
##D longer <- sen_votes(date = "20160301", end_date = "20160415")
## End(Not run)



