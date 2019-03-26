library(gapfill)


### Name: Image
### Title: Image Panels
### Aliases: Image

### ** Examples

library("abind")
t1 <- array(rep(c(1,0), each = 5), c(5,5))
t1[5,3] <- 2 
t2 <- abind(t1, t1, along = 3)
t3 <- abind(t2, t2, along = 4)
Image(t1)
Image(t2)
Image(t3)

## Not run: 
##D Image(ndvi)
##D 
##D p1 <- Image(ndvi, colbarTitle = "NDVI", xlab = "Year", ylab = "DOY",
##D             panelsByrow  = FALSE)
##D p1
##D 
##D p2 <- Image(ndvi[,,3,2], na.value = "white", colbarTitle = "NDVI") +
##D       theme(strip.text.x = element_blank(),
##D             strip.text.y = element_blank(),
##D             panel.border = element_rect(fill = NA, size = 1))
##D p2
##D 
##D ## place modified color bar left
##D p2 + guides(fill = guide_colorbar(title = "NDVI", 
##D                                   barwidth = 1,
##D                                   barheight = 20,
##D                                   label.position = "right", 
##D                                   legend.position = c(0, 0))) +
##D      theme(legend.position = "right")
##D 
##D ## place color bar at bottom
##D p2 + guides(fill = guide_colorbar(title = "NDVI", 
##D                                   barwidth = 7,
##D                                   barheight = .7,
##D                                   label.position = "bottom", 
##D                                   legend.position = c(0, 0)),
##D                                   direction = "horizontal") +
##D      theme(legend.position = "bottom")
## End(Not run)



