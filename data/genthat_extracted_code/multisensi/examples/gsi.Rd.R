library(multisensi)


### Name: gsi
### Title: Generalised Sensitivity Indices: GSI
### Aliases: gsi

### ** Examples

# Test case : the Winter Wheat Dynamic Models (WWDM)
#  input factors design
 data(biomasseX)
# input climate variable
 data(Climat)
# output variables (precalculated to speed up the example)
 data(biomasseY)
#
 GSI <- gsi(2, biomasseY, biomasseX, inertia=3, normalized=TRUE, cumul=FALSE,
            climdata=Climat)
 summary(GSI)
 print(GSI)
 plot(x=GSI, beside=FALSE)
 #plot(GSI, nb.plot=4)         # the 'nb.plot' most influent factors
                               # are represented in the plots
 #plot(GSI,nb.comp=2, xmax=1)  # nb.comp = number of principal components
 #plot(GSI,nb.comp=3, graph=1) # graph=1 for first figure; 2 for 2nd one
                               # and 3 for 3rd one; or 1:3 etc.
 #graph.bar(GSI,col=1, beside=F)  # sensitivity bar plot on the first PC
 #graph.bar(GSI,col=2, xmax=1)    #
  


