library(OpenRepGrid)


### Name: biplotPseudo3d
### Title: See 'biplotPseudo3d' for its use. Draws a biplot of the grid in
###   2D with depth impression (pseudo 3D).
### Aliases: biplotPseudo3d

### ** Examples

## Not run: 
##D    # biplot with 3D impression
##D    biplotPseudo3d(boeker)    
##D    # Slater's biplot with 3D impression                  
##D    biplotPseudo3d(boeker, g=1, h=1, center=1)  
##D 
##D    # show 2nd and 3rd dim. and map 4th 
##D    biplotPseudo3d(boeker, dim=2:3, map.dim=4)  
##D 
##D    # change elem. colors
##D    biplotPseudo3d(boeker, e.color=c("white", "darkgreen"))
##D    # change con. colors 
##D    biplotPseudo3d(boeker, c.color=c("white", "darkgreen")) 
##D    # change color mapping range
##D    biplotPseudo3d(boeker, c.colors.map=c(0, 1))            
##D 
##D    # set uniform con. text size
##D    biplotPseudo3d(boeker, c.cex=1)     
##D    # change text size mapping range        
##D    biplotPseudo3d(boeker, c.cex=c(.4, 1.2))    
## End(Not run)




