library(Cascade)


### Name: unionMicro-methods
### Title: Makes the union between two micro_array objects.
### Aliases: unionMicro unionMicro-methods
###   unionMicro,micro_array,micro_array-method unionMicro,list,ANY-method
### Keywords: methods

### ** Examples

data(simul)
#Create another microarray object with 100 genes
Mbis<-M
#Rename the 100 genes
Mbis@name<-paste(M@name,"bis")
rownames(Mbis@microarray) <- Mbis@name
#Union (merge without duplicated names) of the two microarrays. 
str(unionMicro(M,Mbis))



