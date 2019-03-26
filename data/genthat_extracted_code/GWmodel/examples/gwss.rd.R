library(GWmodel)


### Name: gwss
### Title: Geographically weighted summary statistics (GWSS)
### Aliases: gwss local.corr print.gwss
### Keywords: local, summary stastics

### ** Examples

## Not run: 
##D data(EWHP)
##D data(EWOutline)
##D head(ewhp)
##D houses.spdf <- SpatialPointsDataFrame(ewhp[, 1:2], ewhp)
##D localstats1 <- gwss(houses.spdf, vars = c("PurPrice", "FlrArea"), bw = 50000)
##D head(data.frame(localstats1$SDF))
##D localstats1
##D ##A function for mapping data
##D if(require("RColorBrewer"))
##D {
##D    quick.map <- function(spdf,var,legend.title,main.title) 
##D    {
##D      x <- spdf@data[,var]
##D      cut.vals <- pretty(x)
##D      x.cut <- cut(x,cut.vals)
##D      cut.levels <- levels(x.cut)
##D      cut.band <- match(x.cut,cut.levels)
##D      colors <- brewer.pal(length(cut.levels), "YlOrRd")
##D      colors <- rev(colors)
##D      par(mar=c(1,1,1,1))
##D      plot(ewoutline,col="olivedrab",bg="lightblue1")
##D      title(main.title)
##D      plot(spdf,add=TRUE,col=colors[cut.band],pch=16)
##D      legend("topleft",cut.levels,col=colors,pch=16,bty="n",title=legend.title)
##D   }
##D   quick.map(localstats1$SDF, "PurPrice_LM", "1000's Uk Pounds", 
##D   "Geographically Weighted Mean")
##D   par(mfrow = c(1, 2))
##D   quick.map(localstats1$SDF, "PurPrice_LSKe", "Skewness Level", "Local Skewness")
##D   quick.map(localstats1$SDF, "PurPrice_LSD", "1000's Pounds", "Local Standard Deviation")
##D   #Exploring Non-Stationarity of Relationships
##D   quick.map(localstats1$SDF, "Corr_PurPrice.FlrArea", expression(rho), 
##D   "Geographically Weighted Pearson Correlation")
##D   #Robust, Quantile Based Local Summary Statistics
##D   localstats2 <- gwss(houses.spdf, vars = c("PurPrice", "FlrArea"), 
##D   bw = 50000, quantile = TRUE)
##D   quick.map(localstats2$SDF, "PurPrice_Median", "1000 UK Pounds", 
##D   "Geographically Weighted Median House Price")
##D }
## End(Not run)



