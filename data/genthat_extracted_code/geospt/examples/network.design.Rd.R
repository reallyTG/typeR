library(geospt)


### Name: network.design
### Title: Generating 'ASEPE' associated with a conditioned network design
### Aliases: network.design
### Keywords: spatial

### ** Examples

## Not run: 
##D ### regular grid 10x10
##D vgm1 <- vgm(112.33, "Sph", 4.3441,0)
##D # network: ordinary kriging (without boundary)
##D net1.ok <- network.design(z~1,vgm1, xmin=0,xmax=10, ymin=0, ymax=10, npoint.x=10, 
##D     npoint.y=10, nmax=6)
##D net2.ok <- network.design(z~1,vgm1, xmin=0,xmax=10, ymin=0, ymax=10, npoint.x=20, 
##D     npoint.y=20, nmax=6)
##D # it's worth noting that the variograms are different in each kriging,  
##D # but for this example, the same variogram is used just to show how the function works
##D 
##D # network: simple kriging (without boundary)
##D 
##D net1.sk <- network.design(z~1,vgm1, xmin=0,xmax=10, ymin=0, ymax=10, npoint.x=10, 
##D     npoint.y=10, nmax=6, beta=2)
##D net2.sk <- network.design(z~1,vgm1, xmin=0,xmax=10, ymin=0, ymax=10, npoint.x=20, 
##D     npoint.y=20, nmax=6, beta=2)
##D # network: universal kriging, second order trend (without boundary)
##D net1.uk <- network.design(z~x + y + x*y + I(x^2)+I(y^2),vgm1, xmin=0,xmax=10, ymin=0, 
##D     ymax=10, npoint.x=10, npoint.y=10, nmax=8)
##D net2.uk <- network.design(z~x + y + x*y + I(x^2)+I(y^2),vgm1, xmin=0,xmax=10, ymin=0, 
##D     ymax=10, npoint.x=20, npoint.y=20, nmax=8)
##D 
##D 
##D # Creating the grid with the prediction and plotting points
##D library(geoR)
##D data(ca20)
##D Sr1 <- Polygon(ca20$borders)
##D Srs1 = Polygons(list(Sr1), "s1")
##D Polygon = SpatialPolygons(list(Srs1))
##D vgm2 <- vgm(112.33, "Sph", 15000,0)
##D 
##D # network: ordinary kriging (with boundary)
##D netb1.ok<- network.design(z~1, vgm2, npoints=50, boundary=Polygon, nmax=6)
##D netb2.ok<- network.design(z~1, vgm2, npoints=100, boundary=Polygon, nmax=6)
##D # network: simple kriging (with boundary)
##D netb1.sk <- network.design(z~1, vgm2, npoints=50, boundary=Polygon, nmax=6, beta=2)
##D netb2.sk <- network.design(z~1, vgm2, npoints=100, boundary=Polygon, nmax=6, beta=2)
##D # network: universal kriging, second order trend (with boundary)
##D netb1.uk <- network.design(z~x + y + x*y + I(x^2)+I(y^2), vgm2, npoints=50, 
##D     boundary=Polygon, nmax=8)
##D netb2.uk <- network.design(z~x + y + x*y + I(x^2)+I(y^2), vgm2, npoints=100, 
##D     boundary=Polygon, nmax=8)
## End(Not run)



