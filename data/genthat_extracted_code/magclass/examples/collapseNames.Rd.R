library(magclass)


### Name: collapseNames
### Title: Collapse dataset names
### Aliases: collapseNames

### ** Examples


 x <- new.magpie("GLO",2000,c("bla.a","bla.b"))  
 print(x)
 # An object of class "magpie"
 # , , bla.a
 #      y2000
 # GLO.1    NA
 # , , bla.b
 #      y2000
 # GLO.1    NA

 print(collapseNames(x))
 # An object of class "magpie"
 # , , a
 #      y2000
 # GLO.1    NA
 # , , b
 #      y2000
 # GLO.1    NA

 print(collapseNames(x), collapseNames = 2)
 # An object of class "magpie"
 # , , bla
 #      y2000
 # GLO.1    NA
 # , , bla
 #      y2000
 # GLO.1    NA




