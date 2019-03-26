library(geomorph)


### Name: modularity.test
### Title: Evaluate the degree of modular signal in shape data
### Aliases: modularity.test
### Keywords: analysis

### ** Examples

data(pupfish) 
Y.gpa<-gpagen(pupfish$coords, print.progress = FALSE)    #GPA-alignment    
 #landmarks on the body and operculum
land.gps<-rep('a',56); land.gps[39:48]<-'b'

MT <- modularity.test(Y.gpa$coords,land.gps,CI=FALSE,iter=99)
summary(MT) # Test summary
plot(MT) # Histogram of CR sampling distribution 
# Result implies modularity present



