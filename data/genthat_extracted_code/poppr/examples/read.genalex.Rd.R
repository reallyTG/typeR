library(poppr)


### Name: read.genalex
### Title: Importing data from genalex formatted *.csv files.
### Aliases: read.genalex

### ** Examples


## Not run: 
##D Aeut <- read.genalex(system.file("files/rootrot.csv", package="poppr"))
##D 
##D genalex2 <- read.genalex("genalex2.csv", geo=TRUE)
##D # A genalex file with geographic coordinate data.
##D 
##D genalex3 <- read.genalex("genalex3.csv", region=TRUE) 
##D # A genalex file with regional information.
##D 
##D genalex4 <- read.genalex("genalex4.csv", region=TRUE, geo=TRUE) 
##D # A genalex file with both regional and geographic information.
## End(Not run)



