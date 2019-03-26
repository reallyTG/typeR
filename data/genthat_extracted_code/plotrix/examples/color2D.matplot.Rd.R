library(plotrix)


### Name: color2D.matplot
### Title: Display a numeric matrix as color matrix
### Aliases: color2D.matplot
### Keywords: misc

### ** Examples

 x<-matrix(rnorm(1024),nrow=32)
 # simulate a correlation matrix with values -0.5 to 0.5
 x<-rescale(x,c(-0.5,0.5))
 # add a column with the extreme values (-1,1) to calculate
 # the colors, then drop the extra column in the result
 cellcol<-color.scale(cbind(x,c(-1,rep(1,31))),c(0,1),0,c(1,0))[,1:32]
 color2D.matplot(x,cellcolors=cellcol,main="Blue to red correlations")
 # do the legend call separately to get the full range
 color.legend(0,-4,10,-3,legend=c(-1,-0.5,0,0.5,1),
  rect.col=color.scale(c(-1,-0.5,0,0.5,1),c(0,1),0,c(1,0)),align="rb")
 x<-matrix(rnorm(100),nrow=10)
 # generate colors that show negative values in red to brown
 # and positive in blue-green to green
 cellcol<-matrix(rep("#000000",100),nrow=10)
 cellcol[x<0]<-color.scale(x[x<0],c(1,0.8),c(0,0.8),0)
 cellcol[x>0]<-color.scale(x[x>0],0,c(0.8,1),c(0.8,0))
 # now do hexagons without borders
 color2D.matplot(x,cellcolors=cellcol,xlab="Columns",ylab="Rows",
  do.hex=TRUE,main="2D matrix plot (hexagons)",border=NA)
 # for this one, we have to do the color legend separately
 # because of the two part color scaling
 legval<-seq(min(x),max(x),length.out=6)
 legcol<-rep("#000000",6)
 legcol[legval<0]<-color.scale(legval[legval<0],c(1,0.8),c(0,0.8),0)
 legcol[legval>0]<-color.scale(legval[legval>0],0,c(0.8,1),c(0.8,0))
 color.legend(0,-1.8,3,-1.4,round(c(min(x),0,max(x)),1),rect.col=legcol)
 # do a color only association plot
 xt<-table(sample(1:10,100,TRUE),sample(1:10,100,TRUE))
 observed<-xt[,rev(1:dim(xt)[2])]
 expected<-outer(rowSums(observed),colSums(observed),"*")/sum(xt)
 deviates<-(observed-expected)/sqrt(expected)
 cellcol<-matrix(rep("#000000",100),nrow=10)
 cellcol[deviates<0]<-
  color.scale(deviates[deviates<0],c(1,0.8),c(0,0.5),0)
 cellcol[deviates>0]<-
  color.scale(deviates[deviates>0],0,c(0.7,0.8),c(0.5,0))
 color2D.matplot(x=round(deviates,2),cellcolors=cellcol,
  show.values=TRUE,main="Association plot")
 # Hinton diagram
 border.col<-color.scale(x,extremes=2:3)
 color2D.matplot(x,extremes=c(2,3),main="Hinton diagram (green +, red -)",
  Hinton=TRUE,border=border.col)
 # waffle plot of percentages with two contributing elements
 waffle.col<-fill.corner(c(rep("red",18),rep("blue",45)),10,10)
 color2D.matplot(matrix(1:100,nrow=10),cellcolors=waffle.col,yrev=FALSE,
  border="lightgray",xlab="",ylab="",main="Waffle plot",axes=FALSE)



