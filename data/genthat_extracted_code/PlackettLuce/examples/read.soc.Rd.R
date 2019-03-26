library(PlackettLuce)


### Name: read.soc
### Title: Read Strict Orders - Complete List Data from File
### Aliases: read.soc

### ** Examples


# can take a little while depending on speed of internet connection
## Not run: 
##D # url for preflib data in the "Election Data" category
##D preflib <- "http://www.preflib.org/data/election/"
##D 
##D # strict orderings of four films on Netflix
##D netflix <- read.soc(file.path(preflib, "netflix/ED-00004-00000101.soc"))
##D head(netflix)
##D attr(netflix, "item")
## End(Not run)




