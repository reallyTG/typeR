library(seedy)


### Name: plotdistmat
### Title: Plot genetic distance matrix
### Aliases: plotdistmat

### ** Examples

	
data(withinhost)
Gmat <- gd(withinhost$obs.strain, withinhost$libr, withinhost$nuc, 
           withinhost$librstrains)

colvec <- rainbow(1200)[1:1000] # Color palette
coltext <- rep("black", length(colvec)) # Corresponding text colors
coltext[680:970] <- "white" # White text for darker background colours

plotdistmat(Gmat, colvec, coltext, pos="bottomleft", labels=NULL, numbers=TRUE)




