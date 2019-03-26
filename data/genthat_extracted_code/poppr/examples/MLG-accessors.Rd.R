library(poppr)


### Name: visible
### Title: Accessors for the MLG object
### Aliases: visible visible,MLG-method visible<- visible<-,MLG-method
###   MLG2df MLG2df,MLG-method distname distname,MLG-method distname<-
###   distname<-,MLG-method distargs distargs,MLG-method distargs<-
###   distargs<-,MLG-method distalgo distalgo,MLG-method distalgo<-
###   distalgo<-,MLG-method cutoff cutoff,MLG-method cutoff<-
###   cutoff<-,MLG-method
### Keywords: internal

### ** Examples


## Not run: 
##D # These examples will simply show you what you can do with these
##D set.seed(5000)
##D (x <- sample(10, 20, replace = TRUE))
##D (m <- new("MLG", x))
##D 
##D # Visibility ------------------------------
##D visible(m) # original
##D visible(m) <- "contracted"
##D m          # shows contracted MLGS
##D 
##D # Conversion to data frame ----------------
##D MLG2df(m)  # Grab the internal data frame
##D 
##D # Distance function handling --------------
##D distname(m) # nei.dist
##D distargs(m) # list()
##D distalgo(m) # farthest
##D cutoff(m)
##D 
##D distname(m) <- substitute("diss.dist")
##D distargs(m) <- list(percent = TRUE)
##D distalgo(m) <- "average"
##D cutoff(m)["contracted"] <- 0.2
##D 
## End(Not run)



