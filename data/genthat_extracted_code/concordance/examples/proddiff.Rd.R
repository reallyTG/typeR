library(concordance)


### Name: proddiff
### Title: proddiff
### Aliases: proddiff
### Keywords: proddiff, rauch

### ** Examples

proddiff("020", "hs")
## % Returns "rauch
## % n r w 
## % 1 2 3"

proddiff("020", "hs", setting="lib")
## % Returns "rauch
## % n r w 
## % 1 2 3"

proddiff("020", "hs", prop='w')
## % Returns "w 
## % 0.5" 

proddiff("020", "hs", setting='lib', prop='r')
## % Returns "r 
## % 0.3333333" 



