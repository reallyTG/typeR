library(optiSel)


### Name: opticomp
### Title: Calculates the Optimum Breed Composition
### Aliases: opticomp

### ** Examples

library(optiSel)
data(map) 
data(Cattle)
dir   <- system.file("extdata", package = "optiSel")
files <- paste(dir, "/Chr", 1:2, ".phased", sep="")

#####################################################################
#   Find the optimum breed composition using segment based kinship  #
#####################################################################
IBD <- segIBD(files, minSNP=20, map=map, minL=2.0)
mb  <- opticomp(IBD, Cattle, obj.fun="NGD")

#### Optimum breed composition: ###
round(mb$bc,3)
#   Angler Fleckvieh  Holstein   Rotbunt 
#    0.469     0.444     0.041     0.046 

#### Average kinships within and between breeds: ###
round(mb$f,4)
#          Angler Fleckvieh Holstein Rotbunt
#Angler    0.0523    0.0032   0.0414  0.0417
#Fleckvieh 0.0032    0.0625   0.0036  0.0032
#Holstein  0.0414    0.0036   0.1074  0.0894
#Rotbunt   0.0417    0.0032   0.0894  0.1057

#### Genetic distances between breeds: ###
round(mb$Dist,4)
#         Angler Fleckvieh Holstein Rotbunt
#Angler    0.0000    0.2329   0.1960  0.1930
#Fleckvieh 0.2329    0.0000   0.2853  0.2844
#Holstein  0.1960    0.2853   0.0000  0.1309
#Rotbunt   0.1930    0.2844   0.1309  0.0000

#####################################################################
#   The optimum breed composition depends on the kinship matrix     #
#   and the objective function:                                     #
#####################################################################

bc <- opticomp(IBD, Cattle, obj.fun="NTD")$bc
round(bc,3)
#   Angler Fleckvieh  Holstein   Rotbunt 
#    0.264     0.447     0.148     0.141 




