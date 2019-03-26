library(vote)


### Name: vote-package
### Title: Election Vote Counting
### Aliases: vote-package vote
### Keywords: package

### ** Examples

data(ims_election)
res <- count.votes(ims_election, method = "stv", mcan = 5)
summary(res)

# View invalid votes
invalid.votes(res)

## Not run: 
##D # View results in a browser
##D view(res)
##D 
##D # Write election results into a csv file
##D s <- summary(res)
##D write.csv(s, "IMSstvresults.csv")
## End(Not run)



