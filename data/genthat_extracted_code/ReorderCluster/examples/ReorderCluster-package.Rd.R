library(ReorderCluster)


### Name: ReorderCluster-package
### Title: optimal reordering of the hierarchical tree according to class
###   labels
### Aliases: ReorderCluster-package ReorderCluster
### Keywords: package clustering reorder optimal

### ** Examples

  data(leukemia)
  cpp=FALSE
  rownames(leukemia)=leukemia[,1]
  leukemia=leukemia[,-1]
  matr=leukemia[,-101]
  class=leukemia[,101]
  
  matr=as.matrix(matr)
  dd=dim(matr)

	label=unique(class)
	
	Rowcolor=rainbow(length(label))
	rc=matrix(0,length(class),1)
	ds=matrix(0,length(class),1)

	for (j in 1:length(label))
  	{
		index=which(class==label[j])
		rc[index]=Rowcolor[j]
	}
	
	dist=dist(matr)
	hc <- hclust(dist)
	
	dend=as.dendrogram(hc)
  
	my_palette <- colorRampPalette(c("green", "black", "red"))(n = 399)
	hv <- heatmap.2(matr,Rowv=dend,scale = "none",Colv=NA,
	                col=my_palette, RowSideColors = rc,trace="none",dendrogram="row")
  legend("topright",legend=label,col=Rowcolor,pch=15,cex=0.8)

  res=RearrangeJoseph(hc,as.matrix(dist),class,cpp) 
  
	hcl=res$hcl

  dend=as.dendrogram(hcl)
  
	hv <- heatmap.2(matr,Rowv=dend,scale = "none",Colv=NA,
	                col=my_palette, RowSideColors = rc,trace="none",dendrogram="row")
  legend("topright",legend=label,col=Rowcolor,pch=15,cex=0.8)



