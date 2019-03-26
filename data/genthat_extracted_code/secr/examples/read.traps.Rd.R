library(secr)


### Name: read.traps
### Title: Read Detector Data From File
### Aliases: read.traps
### Keywords: IO

### ** Examples


## Not run: 
##D ## Replace file name with a valid local name 
##D read.traps ("c:/myfolder/mytraps.txt", detector = "proximity")
##D ## "mytraps.txt" should have lines like this 
##D # 1     365     365
##D # 2     365     395
##D # 3     365     425
##D # etc.
##D 
##D ## If we have a dataframe of coordinates...
##D mytrapdf <- data.frame(x = c(365,365,365), y = c(365,395,425), 
##D     row.names = c('A','B','C'))
##D mytrapdf
##D #     x   y
##D # A 365 365
##D # B 365 395
##D # C 365 425
##D ## ...then we can convert it to a `traps' object with
##D tr <- read.traps(data = mytrapdf)
##D summary(tr)
## End(Not run)




