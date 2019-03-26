library(mnis)


### Name: mnis_eligible
### Title: Returns all members who are able to sit in either house, or who
###   are currently ineligible to sit. Members ineligible to sit include
###   but are not necessarily limited to former MPs, members of the
###   judiciary, who are recused from House of Lords duties.
### Aliases: mnis_eligible
### Keywords: mnis

### ** Examples

## Not run: 
##D x <- mnis_eligible(eligible=FALSE, house='all', party='labour')
##D 
##D x <- mnis_eligible(eligible=TRUE, house='all', party='green party')
##D 
##D x <- mnis_eligible(house="commons")
##D 
## End(Not run)



