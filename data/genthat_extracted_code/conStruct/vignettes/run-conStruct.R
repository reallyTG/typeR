## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
library(conStruct)
data(conStruct.data)

## ----eval=FALSE----------------------------------------------------------
#  # load the example dataset
#  data(conStruct.data)
#  
#  # run a conStruct analysis
#  
#  #	you have to specify:
#  #		the number of layers (K)
#  #		the allele frequency data (freqs)
#  #		the geographic distance matrix (geoDist)
#  #		the sampling coordinates (coords)
#  
#  my.run <- conStruct(spatial = TRUE,
#  	 	  			K = 3,
#  				  	freqs = conStruct.data$allele.frequencies,
#  				  	geoDist = conStruct.data$geoDist,
#  				  	coords = conStruct.data$coords,
#  				  	prefix = "spK3")

## ----eval=FALSE----------------------------------------------------------
#  # load the example dataset
#  data(conStruct.data)
#  
#  # run a conStruct analysis
#  
#  #	you have to specify:
#  #		the number of layers (K)
#  #		the allele frequency data (freqs)
#  #		the sampling coordinates (coords)
#  #
#  #	if you're running the nonspatial model,
#  #		you do not have to specify
#  #		the geographic distance matrix (geoDist)
#  
#  my.run <- conStruct(spatial = FALSE,
#  				    K = 2,
#  				    freqs = conStruct.data$allele.frequencies,
#  				    geoDist = NULL,
#  				    coords = conStruct.data$coords,
#  				    prefix = "nspK2")

## ----eval=FALSE----------------------------------------------------------
#  my.run <- conStruct(spatial = TRUE,
#  					K = 3,
#  					freqs = conStruct.data$allele.frequencies,
#  					geoDist = conStruct.data$geoDist,
#  					coords = conStruct.data$coords,
#  					prefix = "spK3",
#  					n.chains = 1,
#  					n.iter = 1000,
#  					make.figs = TRUE,
#  					save.files = TRUE)

## ----echo=FALSE,fig.width=7,fig.height=2.7-------------------------------
par(mfrow=c(1,3),mar=c(4,3,1.5,1))
	plot(c(0,rnorm(500,1,0.2)),type='l',
		xlab="",yaxt='n',ylab="")
		mtext(side=2,text="parameter estimate",padj=-1)
		mtext(side=3,text="(a) looks good",padj=-0.1)
	plot(c(0,rnorm(500,c(log(seq(0,1,length.out=500))),0.2)),type='l',
		xlab="",yaxt='n',ylab="")
		mtext(side=1,text="mcmc iterations",padj=2.6)
		mtext(side=3,text="(b) hasn't converged",padj=-0.1)
	plot(c(0,rnorm(150,1,0.2),rnorm(200,3,0.2),rnorm(150,1,0.2)),type='l',
		xlab="",yaxt='n',ylab="")
		mtext(side=3,text="(c) multi-modal",padj=-0.1)

## ----echo=FALSE,fig.width=7,fig.height=3---------------------------------
w <- matrix(rnorm(40,sample(2:10,40,replace=TRUE),1),
			nrow=20,ncol=2)
w <- w/rowSums(w)
w <- cbind(pmax(rnorm(20,0.15,0.005),0),w)
w <- w/rowSums(w)
conStruct::make.structure.plot(w)

