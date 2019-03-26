library(networkDynamicData)


### Name: manufacturingEmails
### Title: Internal Emails from a Polish Manufacturing Company
### Aliases: manufacturingEmails manufacturingReportsTo
### Keywords: datasets

### ** Examples

data(manufacturingEmails)
## Not run: 
##D # plot the organizational hierarchy
##D plot(manufacturingReportsTo,displaylabels=TRUE,
##D      vertex.cex=0.6,label.cex=0.6,edge.col='gray')
##D      
##D # plot the first two days of emails
##D plot(network.extract(manufacturingEmails,
##D      onset=1262482810,length=60*60*24*2))
##D      
##D # plot email density over time
##D plot(density(as.data.frame(manufacturingEmails)$onset))
##D 
##D # convert date string to POSIX seconds
##D as.numeric(as.POSIXct('2010-09-30',format='%Y-%m-%d'))
##D 
##D # convert POSIX seconds to date string
##D as.POSIXct(1285830000,origin='1970-01-01',tz = 'PL')
## End(Not run)




