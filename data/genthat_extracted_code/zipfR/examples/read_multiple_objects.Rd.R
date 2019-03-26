library(zipfR)


### Name: read.multiple.objects
### Title: Reading Multiple Objects from Files (zipfR)
### Aliases: read.multiple.objects
### Keywords: file

### ** Examples


## Not run: 
##D 
##D ## examples will not be run during package compilation
##D ## since they would require accessing external files
##D 
##D ## suppose that the current working directory contains
##D ## 100 spc files named: rand.1.spc, rand.2.spc, ...,
##D ## rand.100.spc
##D 
##D ## read the files in:
##D spc.list <- read.multiple.objects(".","rand","spc")
##D 
##D ## you can access each spc using the id extracted from
##D ## the file name, e.g.:
##D summary(spc.list[["1"]])
##D 
##D ## more usefully, you might want to iterate over the
##D ## whole list, e.g., to calculate mean V:
##D mean(sapply(spc.list,V))
##D 
##D ## notice that ids are arbitrary strings
##D ## e.g., suppose that directory /home/me/animals
##D ## contains sounds.dog.vgc and sounds.elephant.vgc
##D 
##D ## we read the vgcs in:
##D vgc.list <- read.multiple.objects("/home/me/animals","sounds","vgc")
##D 
##D ## accessing the elephant vgc:
##D V(vgc.list[["elephant"]])
##D 
##D ## of course, tfl-reading works in the same way (assuming
##D ## that the animals directory also contains some tfl files):
##D tfl.list <- read.multiple.objects("/home/me/animals","sounds","tfl")
##D 
##D 
##D 
## End(Not run)




