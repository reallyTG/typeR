library(multisensi)


### Name: dynsi
### Title: Dynamic Sensitivity Indices: DSI
### Aliases: dynsi

### ** Examples

# Test case : the Winter Wheat Dynamic Models (WWDM)
# input factors design,
 data(biomasseX)
# input Climate variables
 data(Climat)
# output variables (precalculated to speed up the example)
 data(biomasseY)
#
 DYNSI <- dynsi(2, biomasseY, biomasseX)
 summary(DYNSI)
 print(DYNSI)
 plot(DYNSI, color=heat.colors)
 #graph.bar(DYNSI,col=1, beside=F)  # sensitivity bar plot
                                    # for the first output (col=1)
 #graph.bar(DYNSI,col=2, xmax=1)    #
  


