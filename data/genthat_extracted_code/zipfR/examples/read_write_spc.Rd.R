library(zipfR)


### Name: read.spc
### Title: Loading and Saving Frequency Spectra (zipfR)
### Aliases: read.spc write.spc
### Keywords: file

### ** Examples


## Not run: 
##D 
##D ## examples will not be run during package compilation
##D ## since they would require accessing and writing to
##D ## external files
##D 
##D ## load Italian ultra- data
##D ## and write corresponding spectrum to external text file
##D data(ItaUltra.spc)
##D write.spc(ItaUltra.spc,"ultra.spc")
##D ## now ultra.spc is a text file with columns m and Vm
##D 
##D ## we ready it back in
##D New.spc <- read.spc("ultra.spc")
##D 
##D ## same spectrum as ItaUltra.spc, compare:
##D summary(New.spc)
##D summary(ItaUltra.spc)
##D 
##D ## DON'T do the following, incomplete spectrum will not be
##D ## restored properly!!!
##D zm <- lnre("zm",ItaUltra.spc) # estimate model
##D zm.spc <- lnre.spc(zm,N(zm)) # incomplete spectrum from model
##D write.spc(zm.spc,"var.spc") # warnings
##D bad.spc <- read.spc("/Users/baroni/Desktop/var.spc")
##D ## latter is DIFFERENT from zm.spc!!!
##D 
## End(Not run)




