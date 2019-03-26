library(RAM)


### Name: data.revamp
### Title: Transform OTU Table
### Aliases: data.revamp
### Keywords: datagen

### ** Examples

data(ITS1, ITS2, meta)
data.new <- data.revamp(data=list(ITS1=ITS1), is.OTU=TRUE,
                        ranks=c("f", "g"), stand.method="log")
## Not run: 
##D data.new <- data.revamp(data=list(ITS1=ITS1), is.OTU=TRUE,
##D                         ranks=NULL, stand.method="log")
##D data.new <- data.revamp(data=list(ITS1=ITS1, ITS2=ITS2),
##D            is.OTU=TRUE, ranks=c("f", "g"), stand.method="total")
##D names(data.new)
## End(Not run)



