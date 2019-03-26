library(oc)


### Name: oc
### Title: Optimal Classification Roll Call Scaling
### Aliases: oc
### Keywords: multivariate

### ** Examples

    #This data file is the same as reading file using:
    ## Not run: 
##D     sen90 <- readKH("ftp://voteview.com/sen90kh.ord")
##D     
## End(Not run)
    #All ORD files can be found on www.voteview.com
    data(sen90)
    summary(sen90)

	#Small executable example
	sen90.1d <- oc(sen90,dims=1,polarity=c(7))

    #Output file identical to one produced by command below
    ## Not run: 
##D     sen90oc <- oc(sen90,dims=2,polarity=c(7,2))
##D 	
## End(Not run)
    data(sen90oc)
    summary(sen90oc)
    plot(sen90oc) 




