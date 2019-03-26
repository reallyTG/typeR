library(VCA)


### Name: legend.m
### Title: Add Legend to Margin.
### Aliases: legend.m

### ** Examples

## Not run: 
##D 
##D par( mar=c(10,10,10,10) )
##D plot(1, type="n", axes=FALSE, xlab="", ylab="")
##D box()
##D # add legend to different regions within the 'margin'
##D legend.m(margin="topleft", 		fill="black",	legend=c("topleft"))
##D legend.m(margin="top", 			fill="red", 	legend=c("top"))
##D legend.m(margin="topright", 		fill="blue",	legend=c("topright"))
##D legend.m(margin="right", 		fill="green",	legend=c("right"))
##D legend.m(margin="bottomright", 	fill="yellow",	legend=c("bottomright"))
##D legend.m(margin="bottom", 		fill="orange",	legend=c("bottom"))
##D legend.m(margin="bottomleft", 	fill="cyan",	legend=c("bottomleft"))
##D legend.m(margin="left", 			fill="magenta", legend=c("left"))
##D 
##D data(dataEP05A2_3)
##D dataEP05A2_3$user <- sample(rep(c(1,2), 40))
##D  
##D varPlot( y~day+day:run, dataEP05A2_3, mar=c(1,5,1,7), VCnam=list(side=4), 
##D 	        Points=list(pch=list(var="user", pch=c(2, 8))) )
##D # always check order of factor levels before annotating
##D order(unique(dataEP05A2_3$user))
##D legend.m(pch=c(8,2), legend=c("User 1", "User 2"))
##D 
##D # using different colors 
##D varPlot( y~day+day:run, dataEP05A2_3, mar=c(1,5,1,7), VCnam=list(side=4),
##D          Points=list(col=list(var="user", col=c("red", "green"))) )
##D legend.m(fill=c("green", "red"), legend=c("User 1", "User 2"))
##D 
##D # now combine point-coloring and plotting symbols
##D # to indicate two additional classification variables
##D varPlot( y~day+day:run, dataEP05A2_3, mar=c(1,5,1,10),
##D          VCnam=list(side=4, cex=1.5),
##D          Points=list(col=list(var="user", col=c("red", "darkgreen")),
##D                      pch=list(var="cls2", pch=c(21, 22)),
##D                      bg =list(var="user", bg =c("orange", "green"))) )
##D 
##D # two additional classification variables
##D dataEP05A2_3$user <- sample(rep(c(1,2), 40))
##D dataEP05A2_3$cls2 <- sample(rep(c(1,2), 40))
##D 
##D # add legend to (right) margin
##D legend.m(margin="right", pch=c(21, 22, 22, 22), 
##D          pt.bg=c("white", "white", "orange", "green"),  
##D          col=c("black", "black", "white", "white"), 
##D          pt.cex=c(1.75, 1.75, 2, 2),
##D          legend=c("Cls2=1", "Cls2=2", "User=2", "User=1"), 
##D          cex=1.5)
## End(Not run)



