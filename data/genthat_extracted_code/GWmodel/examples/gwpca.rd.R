library(GWmodel)


### Name: gwpca
### Title: GWPCA
### Aliases: gwpca robustSvd rwpca wpca wt.median print.gwpca
### Keywords: robust, GWPCA

### ** Examples

## Not run: 
##D if(require("mvoutlier") && require("RColorBrewer"))
##D {
##D   data(bsstop)
##D   Data.1 <- bsstop[, 1:14]
##D   colnames(Data.1)
##D   Data.1.scaled <- scale(as.matrix(Data.1[5:14]))  # standardised data...
##D   rownames(Data.1.scaled) <- Data.1[, 1]
##D   #compute principal components:
##D   pca <- princomp(Data.1.scaled, cor = FALSE, scores = TRUE)  
##D   # use covariance matrix to match the following...
##D   pca$loadings
##D   data(bss.background)
##D   backdrop <- function() 
##D    plot(bss.background, asp = 1, type = "l", xaxt = "n", yaxt = "n", 
##D    xlab = "", ylab = "", bty = "n", col = "grey")
##D   pc1 <- pca$scores[, 1]
##D   backdrop()
##D   points(Data.1$XCOO[pc1 > 0], Data.1$YCOO[pc1 > 0], pch = 16, col = "blue")
##D   points(Data.1$XCOO[pc1 < 0], Data.1$YCOO[pc1 < 0], pch = 16, col = "red")
##D   
##D   #Geographically Weighted PCA and mapping the local loadings
##D   # Coordinates of the sites
##D   Coords1 <- as.matrix(cbind(Data.1$XCOO,Data.1$YCOO)) 
##D   d1s <- SpatialPointsDataFrame(Coords1,as.data.frame(Data.1.scaled))
##D   pca.gw <- gwpca(d1s,vars=colnames(d1s@data),bw=1000000,k=10)
##D   local.loadings <- pca.gw$loadings[, , 1]  
##D   
##D   # Mapping the winning variable with the highest absolute loading
##D   # note first component only - would need to explore all components..
##D   
##D   lead.item <- colnames(local.loadings)[max.col(abs(local.loadings))]
##D   df1p = SpatialPointsDataFrame(Coords1, data.frame(lead = lead.item))
##D   backdrop()
##D   colour <- brewer.pal(8, "Dark2")[match(df1p$lead, unique(df1p$lead))]
##D   plot(df1p, pch = 18, col = colour, add = TRUE)
##D   legend("topleft", as.character(unique(df1p$lead)), pch = 18, col = 
##D       brewer.pal(8, "Dark2"))
##D   backdrop()
##D   
##D   #Glyph plots give a view of all the local loadings together
##D   glyph.plot(local.loadings, Coords1, add = TRUE)
##D   
##D   #it is not immediately clear how to interpret the glyphs fully, 
##D   #so inter-actively identify the full loading information using:
##D   check.components(local.loadings, Coords1)
##D   
##D   # GWPCA with an optimal bandwidth
##D   bw.choice <- bw.gwpca(d1s,vars=colnames(d1s@data),k=2) 
##D   pca.gw.auto  <- gwpca(d1s,vars=colnames(d1s@data),bw=bw.choice,k=2)
##D   # note first component only - would need to explore all components..
##D   local.loadings <- pca.gw.auto$loadings[, , 1]  
##D   
##D   lead.item <- colnames(local.loadings)[max.col(abs(local.loadings))]
##D   df1p = SpatialPointsDataFrame(Coords1, data.frame(lead = lead.item))
##D   backdrop()
##D   colour <- brewer.pal(8, "Dark2")[match(df1p$lead, unique(df1p$lead))]
##D   plot(df1p, pch = 18, col = colour, add = TRUE)
##D   legend("topleft", as.character(unique(df1p$lead)), pch = 18, 
##D   col = brewer.pal(8, "Dark2"))
##D   
##D   # GWPCPLOT for investigating the raw multivariate data
##D   gw.pcplot(d1s, vars=colnames(d1s@data),focus=359, bw = bw.choice) 
##D }
## End(Not run)



