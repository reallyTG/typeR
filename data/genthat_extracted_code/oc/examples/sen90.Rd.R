library(oc)


### Name: sen90
### Title: 90th U.S. Senate Roll Call Vote Matrix
### Aliases: sen90
### Keywords: datasets

### ** Examples

    #This data file is the same as reading file using:
    ## Not run: 
##D     sen90 <- readKH("https://voteview.com/static/data/out/votes/S090_votes.ord")
##D 	
## End(Not run)
    data(sen90)
    summary(sen90)

    #Output file identical to one produced by command below
    ## Not run: 
##D     sen90oc <- oc(sen90,dims=2,polarity=c(7,2))
##D 	
## End(Not run)
    data(sen90oc)
    summary(sen90oc)
    plot(sen90oc)



