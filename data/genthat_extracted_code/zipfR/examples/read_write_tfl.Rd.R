library(zipfR)


### Name: read.tfl
### Title: Loading and Saving Type Frequency Lists (zipfR)
### Aliases: read.tfl write.tfl
### Keywords: file

### ** Examples


## Not run: 
##D 
##D ## examples will not be run during package compilation
##D ## since they would require accessing and writing to
##D ## external files
##D 
##D ## load Brown tfl and write it to external file
##D data(Brown.tfl)
##D write.tfl(Brown.tfl,"brown.tfl")
##D ## now brown.tfl is external file with fields
##D ## k (an id), f (frequency), type (word)
##D 
##D ## read it back in
##D New.tfl <- read.tfl("brown.tfl")
##D 
##D ## same as Brown.tfl
##D summary(New.tfl)
##D summary(Brown.tfl)
##D print(New.tfl)
##D print(Brown.tfl)
##D head(New.tfl)
##D head(Brown.tfl)
##D 
##D ## suppose you have a text file with a
##D ## frequency list, one f per line, e.g.:
##D ## f
##D ## 14
##D ## 12
##D ## 31
##D ## ...
##D 
##D ## you can import this with read.tfl
##D MyData.tfl <- read.tfl("mylist.txt")
##D summary(MyData.tfl)
##D print(MyData.tfl) # ids in column k added by zipfR
##D 
##D ## from this you can generate a spectrum with tfl2spc
##D MyData.spc <- tfl2spc(MyData.tfl)
##D summary(MyData.spc)
##D 
## End(Not run)




