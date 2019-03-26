library(pscl)


### Name: s109
### Title: rollcall object, 109th U.S. Senate (2005-06).
### Aliases: s109
### Keywords: datasets

### ** Examples

require(pscl)
data(s109)
is(s109,"rollcall")    ## TRUE
s109                   ## print method for class rollcall
summary(s109)          ## summary method
summary(s109,verbose=TRUE)
## Not run: 
##D ## how s109 was created
##D require(pscl)
##D s109 <- readKH("https://voteview.com/static/data/out/votes/S109_votes.ord",
##D                desc="109th U.S. Senate",
##D                debug=TRUE)
##D url <- "https://voteview.com/static/data/out/rollcalls/S109_rollcalls.csv"
##D 
##D s109$vote.data <- data.frame(read.csv(file=url,header=TRUE))
##D s109$vote.data$date <- as.Date(s109$vote.data$date,
##D                                format="##D 
##D dimnames(s109$votes)[[2]] <- paste(s109$vote.data$session,
##D                                    s109$vote.data$number,sep="-")
## End(Not run)



