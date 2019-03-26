library(vcdExtra)


### Name: Depends
### Title: Dependencies of R Packages
### Aliases: Depends
### Keywords: datasets

### ** Examples

data(Depends)
plot(Depends, xlab="Number of Dependencies", ylab="Number of R Packages", lwd=8)

## Not run: 
##D # The code below, from Joseph Rickert, downloads and tabulates the data
##D p <- as.data.frame(available.packages(),stringsAsFactors=FALSE)
##D names(p)
##D 
##D pkgs <- data.frame(p[,c(1,4)])                  # Pick out Package names and Depends
##D row.names(pkgs) <- NULL                         # Get rid of row names
##D pkgs <- pkgs[complete.cases(pkgs[,2]),]         # Remove NAs
##D 
##D pkgs$Depends2 <-strsplit(pkgs$Depends,",")      # split list of Depends
##D pkgs$numDepends <- as.numeric(lapply(pkgs$Depends2,length)) # Count number of dependencies in list
##D zeros <- c(rep(0,dim(p)[1] - dim(pkgs)[1]))     # Account for packages with no dependencies
##D Deps <- as.vector(c(zeros,pkgs$numDepends))     # Set up to tablate
##D Depends <- table(Deps)
##D 
## End(Not run)



