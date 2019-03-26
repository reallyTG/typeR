library(imageData)


### Name: splitContGRdiff
### Title: Adds the growth rates calculated continuously over time for
###   subsets of a response to a 'data.frame'
### Aliases: splitContGRdiff
### Keywords: data manip

### ** Examples

data(exampleData)
longi.dat <- splitContGRdiff(longi.dat, response="Area.smooth", 
                             INDICES = "Snapshot.ID.Tag", which.rates=c("AGR", "RGR"))



