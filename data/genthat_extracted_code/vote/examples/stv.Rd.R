library(vote)


### Name: stv
### Title: Single Transferable Vote
### Aliases: stv summary.vote.stv view.vote.stv view print.summary.vote.stv
###   vote.stv
### Keywords: tools

### ** Examples

# Reproducing example from Wikipedia
# https://en.wikipedia.org/wiki/Single_transferable_vote#Example
# Uses eps=1
data(food_election)
stv.food <- stv(food_election, mcan = 3, eps = 1)
summary(stv.food)
## Not run: 
##D view(stv.food)
## End(Not run)

# Example of the IMS Council voting
data(ims_election)
stv.ims <- stv(ims_election, mcan = 5)
## Not run: 
##D view(stv.ims)
##D 
##D # write election results into a csv file
##D s <- summary(stv.ims)
##D write.csv(s, "myfile.csv")
## End(Not run)

# Example of a small committee dataset
# with four candidates (C) and four
# voting committee members (uses tie-breaking)
votes <- data.frame(C1=c(3,2,1,3), C2=c(2,1,2,4),
                    C3=c(4,3,3,1), C4=c(1,4,4,2))
stv(votes, mcan = 2, verbose = TRUE)                    



