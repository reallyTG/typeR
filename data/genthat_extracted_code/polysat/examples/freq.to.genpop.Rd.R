library(polysat)


### Name: freq.to.genpop
### Title: Convert Allele Frequencies for Adegenet
### Aliases: freq.to.genpop
### Keywords: manip

### ** Examples

# create a simple allele frequency table
# (usually done with simpleFreq or deSilvaFreq)
myfreq <- data.frame(row.names=c("popA","popB"), Genomes=c(120,100),
                     locG.152=c(0.1,0.4), locG.156=c(0.5, 0.3),
                     locG.160=c(0.4, 0.3), locK.179=c(0.15, 0.25),
                     locK.181=c(0.35, 0.6), locK.183=c(0.5, 0.15))
myfreq

# convert to adegenet format
gpfreq <- freq.to.genpop(myfreq)
gpfreq

## Not run: 
##D # If you have adegenet installed, you can now make this into a
##D # genpop object.
##D require(adegenet)
##D mygenpop <- genpop(gpfreq, ploidy=as.integer(4), type="codom")
##D 
##D # examine the object that has been created
##D mygenpop
##D popNames(mygenpop)
##D mygenpop@tab
##D mygenpop@all.names
##D 
##D # Perform a distance calculation with the object
##D dist.genpop(mygenpop)
## End(Not run)



