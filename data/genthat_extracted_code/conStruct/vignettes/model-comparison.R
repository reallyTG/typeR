## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE----------------------------------------------------------
#  # load the library
#  library(conStruct)
#  
#  # load the example dataset
#  data(conStruct.data)
#  
#  # to run a cross-validation analysis
#  # you have to specify:
#  #		the numbers of layers you want to compare (K)
#  #		the allele frequency data (freqs)
#  #		the geographic distance matrix (geoDist)
#  #		the sampling coordinates (coords)
#  
#  my.xvals <- x.validation(train.prop = 0.9,
#  				  		 n.reps = 8,
#  				  		 K = 1:3,
#  				  		 freqs = conStruct.data$allele.frequencies,
#  				  		 data.partitions = NULL,
#  				  		 geoDist = conStruct.data$geoDist,
#  				  		 coords = conStruct.data$coords,
#  				  		 prefix = "example",
#  				  		 n.iter = 1e3,
#  				  		 make.figs = TRUE,
#  				  		 save.files = FALSE,
#  				  		 parallel = FALSE,
#  				  		 n.nodes = NULL)

## ---- eval=FALSE---------------------------------------------------------
#  # read in results from text files
#  
#  sp.results <- as.matrix(
#  				read.table("example_sp_xval_results.txt",
#  						   header = TRUE,
#  						   stringsAsFactors = FALSE)
#  			   )
#  nsp.results <- as.matrix(
#  				read.table("example_nsp_xval_results.txt",
#  						   header = TRUE,
#  						   stringsAsFactors = FALSE)
#  			   )
#  
#  # or, format results from the output list
#  sp.results <- Reduce("cbind",lapply(my.xvals,function(x){unlist(x$sp)}),init=NULL)
#  nsp.results <- Reduce("cbind",lapply(my.xvals,function(x){unlist(x$nsp)}),init=NULL)

## ----echo=FALSE----------------------------------------------------------
	sp.results <- matrix(c(-1.201, 0.000, -1.819, -4.579, -5.730, 0.000, 0.000, -5.346, -1.114, -7.315, -8.853, 0.000, 0.000, -6.125, -3.602, 0.000, -11.155, -5.506, -3.650, 0.000, -2.909, 0.000, -4.799, -9.890),nrow=3,ncol=8)
	row.names(sp.results) <- paste0("K=",1:3)
	nsp.results <- matrix(c(-685.108, -416.726, -141.223, -684.230, -418.651, -148.589, -679.392, -404.326, -147.367, -682.996, -415.190, -147.767, -680.044, -411.200, -147.288, -677.238, -410.037, -149.066, -679.914, -404.820, -145.464, -672.501, -414.927, -145.073),nrow=3,ncol=8)
	row.names(nsp.results) <- paste0("K=",1:3)

## ----eval=TRUE,echo=FALSE------------------------------------------------
knitr::kable(sp.results,row.names=TRUE,col.names=paste0("rep",1:8),caption="Spatial cross-validation results")

## ---- eval=TRUE, fig.width=8,fig.height=5--------------------------------

# first, get the 95% confidence intervals for the spatial and nonspatial
#	models over values of K (mean +/- 1.96 the standard error)

sp.CIs <- apply(sp.results,1,function(x){mean(x) + c(-1.96,1.96) * sd(x)/length(x)})
nsp.CIs <- apply(nsp.results,1,function(x){mean(x) + c(-1.96,1.96) * sd(x)/length(x)})

# then, plot cross-validation results for K=1:3 with 8 replicates

par(mfrow=c(1,2))
plot(rowMeans(sp.results),
	 pch=19,col="blue",
	 ylab="predictive accuracy",xlab="values of K",
	 ylim=range(sp.results,nsp.results),
	 main="cross-validation results")
	points(rowMeans(nsp.results),col="green",pch=19)

# finally, visualize results for the spatial model
#	separately with its confidence interval bars
#
# note that you could do the same with the spatial model, 
#	but the confidence intervals don't really show up 
#	because the differences between predictive accuracies
#	across values of K are so large.

plot(rowMeans(sp.results),
	 pch=19,col="blue",
	 ylab="predictive accuracy",xlab="values of K",
	 ylim=range(sp.CIs),
	 main="spatial cross-validation results")
segments(x0 = 1:nrow(sp.results),
		 y0 = sp.CIs[1,],
		 x1 = 1:nrow(sp.results),
		 y1 = sp.CIs[2,],
		 col = "blue",lwd=2)

## ----eval=FALSE----------------------------------------------------------
#  
#  # load the example dataset
#  data(conStruct.data)
#  
#  # to run a cross-validation analysis
#  # you have to specify:
#  #		the numbers of layers you want to compare (K)
#  #		the allele frequency data (freqs)
#  #		the geographic distance matrix (geoDist)
#  #		the sampling coordinates (coords)
#  
#  # in addition, here we run our analysis parallelized
#  #	across all replicates using 4 nodes
#  
#  my.xvals <- x.validation(train.prop = 0.9,
#  				  		 n.reps = 8,
#  				  		 K = 1:3,
#  				  		 freqs = conStruct.data$allele.frequencies,
#  				  		 data.partitions = NULL,
#  				  		 geoDist = conStruct.data$geoDist,
#  				  		 coords = conStruct.data$coords,
#  				  		 prefix = "example",
#  				  		 n.iter = 1e3,
#  				  		 make.figs = TRUE,
#  				  		 save.files = FALSE,
#  				  		 parallel = TRUE,
#  				  		 n.nodes = 4)
#  

## ----eval=FALSE----------------------------------------------------------
#  
#  library(parallel)
#  library(foreach)
#  library(doParallel)
#  
#  cl <- makeCluster(4,type="FORK")
#  registerDoParallel(cl)
#  
#  my.xvals <- x.validation(train.prop = 0.9,
#  				  		 n.reps = 8,
#  				  		 K = 1:3,
#  				  		 freqs = conStruct.data$allele.frequencies,
#  				  		 data.partitions = NULL,
#  				  		 geoDist = conStruct.data$geoDist,
#  				  		 coords = conStruct.data$coords,
#  				  		 prefix = "example",
#  				  		 n.iter = 1e3,
#  				  		 make.figs = TRUE,
#  				  		 save.files = FALSE,
#  				  		 parallel = TRUE,
#  				  		 n.nodes = 4)
#  
#  stopCluster(cl)
#  

## ----eval=FALSE----------------------------------------------------------
#  
#  # Loop through output files generated by conStruct
#  #	runs with K=1 through 5 and calculate the
#  #	layer contributions for each layer in each run	
#  
#  layer.contributions <- matrix(NA,nrow=5,ncol=5)
#  
#  # load the conStruct.results.Robj and data.block.Robj
#  #	files saved at the end of a conStruct run
#  load("K1_sp_conStruct.results.Robj")
#  load("K1_sp_data.block.Robj")
#  
#  # calculate layer contributions
#  layer.contributions[,1] <- c(calculate.layer.contribution(conStruct.results[[1]],data.block),rep(0,4))
#  tmp <- conStruct.results[[1]]$MAP$admix.proportions
#  
#  for(i in 2:5){
#  	# load the conStruct.results.Robj and data.block.Robj
#  	#	files saved at the end of a conStruct run
#  	load(sprintf("K%s_sp_conStruct.results.Robj",i))
#  	load(sprintf("K%s_sp_data.block.Robj",i))
#  	
#  	# match layers up across runs to keep plotting colors consistent
#  	#	for the same layers in different runs
#  	tmp.order <- match.layers.x.runs(tmp,conStruct.results[[1]]$MAP$admix.proportions)	
#  
#  	# calculate layer contributions
#  	layer.contributions[,i] <- c(calculate.layer.contribution(conStruct.results=conStruct.results[[1]],
#  															 data.block=data.block,
#  															 layer.order=tmp.order),
#  									rep(0,5-i))
#  	tmp <- conStruct.results[[1]]$MAP$admix.proportions[,tmp.order]
#  }

## ---- echo=FALSE---------------------------------------------------------
	layer.contributions <- matrix(c(1.000, 0.000, 0.000, 0.000, 0.000, 0.680, 0.320, 0.000, 0.000, 0.000, 0.682, 0.318, 0.000, 0.000, 0.000, 0.678, 0.322, 0.000, 0.000, 0.000, 0.684, 0.315, 0.000, 0.000, 0.000),nrow=5,ncol=5)
	row.names(layer.contributions) <- paste0("Layer_",1:5)

## ---- eval=TRUE,echo=FALSE-----------------------------------------------
knitr::kable(layer.contributions,row.names=TRUE,col.names=paste0("K=",1:5),caption="Contributions for each layer for runs done with K=1 through 5")

## ---- eval=TRUE,fig.width=5,fig.height=5---------------------------------
barplot(layer.contributions,
		col=c("blue", "red", "goldenrod1", "forestgreen", "darkorchid1"),
		xlab="",
		ylab="layer contributions",
		names.arg=paste0("K=",1:5))

## ----echo=FALSE----------------------------------------------------------
library(conStruct)
data(conStruct.data)
data.partitions <- conStruct:::make.data.partitions(3,conStruct.data$allele.frequencies,0.9)

## ----eval=TRUE-----------------------------------------------------------
# In this dataset, there are 36 samples and 1e4 loci total, 
#	and the data partitions are generated 
#		with a 90% training 10% testing split

str(data.partitions,max.level=3,give.attr=FALSE,vec.len=3)

