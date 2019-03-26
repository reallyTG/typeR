library(UScensus2000cdp)


### Name: oregon.cdp
### Title: oregon.cdp
### Aliases: oregon.cdp
### Keywords: datasets

### ** Examples

data(oregon.cdp)

############################################
## Helper function for handling coloring of the map
############################################
color.map<- function(x,dem,y=NULL){
	l.poly<-length(x@polygons)
	dem.num<- cut(dem ,breaks=ceiling(quantile(dem)),dig.lab = 6)
	dem.num[which(is.na(dem.num)==TRUE)]<-levels(dem.num)[1]
	l.uc<-length(table(dem.num))
if(is.null(y)){
	col.heat<-heat.colors(16)[c(14,8,4,1)] ##fixed set of four colors
}else{
	col.heat<-y
	}
dem.col<-cbind(col.heat,names(table(dem.num)))
colors.dem<-vector(length=l.poly)
for(i in 1:l.uc){
	colors.dem[which(dem.num==dem.col[i,2])]<-dem.col[i,1]
	}
out<-list(colors=colors.dem,dem.cut=dem.col[,2],table.colors=dem.col[,1])
return(out)
}
############################################
## Helper function for handling coloring of the map
############################################

colors.use<-color.map(oregon.cdp,oregon.cdp$pop2000)
plot(oregon.cdp,col=colors.use$colors)
#text(coordinates(oregon.cdp),oregon.cdp$name,cex=.3)
title(main="Census Designated Places \n of Oregon, 2000", sub="Quantiles (equal frequency)")
legend("bottomright",legend=colors.use$dem.cut,fill=colors.use$table.colors,bty="o",title="Population Count",bg="white")



###############################
### Alternative way to do the above
###############################
## Not run: 
##D ####This example requires the following additional libraries
##D library(RColorBrewer)
##D library(classInt)  
##D library(maps)
##D ####This example requires the following additional libraries
##D 
##D data(oregon.cdp)
##D 
##D map('state',region='oregon')
##D plotvar <- oregon.cdp$pop2000
##D 	nclr <- 4
##D 	#BuPu
##D 	plotclr <- brewer.pal(nclr,"BuPu")
##D 	class <- classIntervals(plotvar, nclr, style="quantile")
##D 	colcode <- findColours(class, plotclr)
##D 	plot(oregon.cdp, col=colcode, border="transparent",add=TRUE)
##D 	#transparent
##D title(main="Census Designated Places\n of Oregon, 2000", sub="Quantiles (equal frequency)")
##D map.text("county", "oregon",cex=.7,add=TRUE)
##D map('county','oregon',add=TRUE)
##D legend("bottomright","(x,y)", legend=names(attr(colcode, "table")),fill=attr(colcode, "palette"), 
##D cex=0.9, bty="o", title="Population Count",bg="white")
## End(Not run)



