library(BCellMA)


### Name: targetingMatrix
### Title: Function to the calculation of the number of Nucleotids at three
###   positions before and after a mutation
### Aliases: targetingMatrix

### ** Examples

data(IMGTtab2)
data(IMGTtab7)
germline<-germlineReconstr(IMGTtab2$V_REGION, IMGTtab7$V_REGION)
data<-targetingMatrix(data_tab2=IMGTtab2, data_tab_germline=germline, data_tab7=IMGTtab7)
data



