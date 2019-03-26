library(SpatialVx)


### Name: minboundmatch
### Title: Minimum Boundary Separation Feature Matching
### Aliases: minboundmatch
### Keywords: manip math

### ** Examples


x <- y <- matrix(0, 100, 100)
x[2:3,c(3:6, 8:10)] <- 1
y[c(4:7, 9:10),c(7:9, 11:12)] <- 1

x[30:50,45:65] <- 1
y[c(22:24, 99:100),c(50:52, 99:100)] <- 1

hold <- make.SpatialVx( x, y, field.type = "contrived", units = "none",
    data.name = "Example", obs.name = "x", model.name = "y" )

look <- FeatureFinder(hold, smoothpar=0.5)

look2 <- minboundmatch( look )

look2 <- MergeForce( look2 )

par( mfrow = c(1,2) )
plot( look2 )

look3 <- minboundmatch( look, type = "multiple", mindist = 50 )
look3 <- MergeForce( look2 )
plot( look3 )

look4 <- minboundmatch( look, type = "multiple", mindist = 20 )
look4 <- MergeForce( look4 )
plot( look4 )





