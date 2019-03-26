library(OpenRepGrid)


### Name: bertinCluster
### Title: Bertin display with corresponding cluster anaylsis.
### Aliases: bertinCluster

### ** Examples

## Not run: 
##D 
##D    # default is euclidean distance and ward clustering 
##D    bertinCluster(bell2010)                                     
##D 
##D    ### applying different distance measures and cluster methods
##D 
##D    # euclidean distance and single linkage clustering 
##D    bertinCluster(bell2010, cmethod="single")
##D    # manhattan distance and single linkage clustering             
##D    bertinCluster(bell2010, dmethod="manhattan", cm="single") 
##D    # minkowksi distance with power of 2 = euclidean distance  
##D    bertinCluster(bell2010, dm="mink", p=2)                     
##D 
##D    ### using different methods for constructs and elements
##D 
##D    # ward clustering for constructs, single linkage for elements
##D    bertinCluster(bell2010, cmethod=c("ward", "single"))        
##D    # euclidean distance measure for constructs, manhatten 
##D    # distance for elements
##D    bertinCluster(bell2010, dmethod=c("euclidean", "man"))
##D    # minkowski metric with different powers for constructs and elements    
##D    bertinCluster(bell2010, dmethod="mink", p=c(2,1)))          
##D 
##D    ### clustering either constructs or elements only
##D    # euclidean distance and ward clustering for constructs no 
##D    # clustering for elements
##D    bertinCluster(bell2010, cmethod=c("ward", NA))  
##D    # euclidean distance and single linkage clustering for elements 
##D    # no clustering for constructs            
##D    bertinCluster(bell2010, cm=c(NA, "single"))                 
##D 
##D    ### changing the appearance
##D    # different dendrogram type        
##D    bertinCluster(bell2010, type="rectangle")  
##D    # no axis drawn for dendrogram                 
##D    bertinCluster(bell2010, draw.axis=F)                        
##D 
##D    ### passing on arguments to bertin function via ...
##D     # grey cell borders in bertin display
##D    bertinCluster(bell2010, border="grey")  
##D    # omit printing of grid scores, i.e. colors only                  
##D    bertinCluster(bell2010, showvalues=FALSE)                   
##D 
##D    ### changing the layout
##D    # making the vertical dendrogram bigger
##D    bertinCluster(bell2010, xsegs=c(0, .2, .5, .7, 1))
##D    # making the horizontal dendrogram bigger          
##D    bertinCluster(bell2010, ysegs=c(0, .3, .8, 1))              
## End(Not run)




