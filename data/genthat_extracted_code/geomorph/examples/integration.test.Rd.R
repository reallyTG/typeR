library(geomorph)


### Name: integration.test
### Title: Quantify morphological integration between modules
### Aliases: integration.test
### Keywords: analysis

### ** Examples

data(plethodon) 
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment    
#landmarks on the skull and mandible assigned to partitions
land.gps<-c("A","A","A","A","A","B","B","B","B","B","B","B") 
IT <- integration.test(Y.gpa$coords, partition.gp=land.gps, iter=999)
summary(IT) # Test summary
plot(IT) # PLS plot
IT$left.pls.vectors # extracting just the left (first block) singular vectors



