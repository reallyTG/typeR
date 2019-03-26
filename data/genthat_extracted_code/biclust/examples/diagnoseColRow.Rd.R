library(biclust)


### Name: diagnoseColRow
### Title: Bootstrap Procedure for Bicluster Diagnostics
### Aliases: diagnoseColRow
### Keywords: bicluster bootstrap

### ** Examples

#---simulate dataset with 1 bicluster ---#
xmat<-matrix(rnorm(20*50,0,0.25),50,50) # background noise only 
rowSize <- 20 #number of rows in a bicluster 
colSize <- 10 #number of columns in a bicluster
a1<-rnorm(rowSize,1,0.1) #sample row effect from N(0,0.1) #adding a coherent values bicluster:
b1<-rnorm((colSize),2,0.25)  #sample column effect from N(0,0.05)
mu<-0.01 #constant value signal
 for ( i in 1 : rowSize){
 	for(j in 1: (colSize)){
 		xmat[i,j] <- xmat[i,j] + mu + a1[i] + b1[j] 	
 	}
 }
 #--obtain a bicluster by running an algorithm---# 
plaidmab <- biclust(x=xmat, method=BCPlaid(), cluster="b", fit.model = y ~ m + a+ b,  
background = TRUE, row.release = 0.6, col.release = 0.7, shuffle = 50, back.fit = 5, 
max.layers = 1, iter.startup = 100, iter.layer = 100, verbose = TRUE)

#Run boosotrap procedure:
Bootstrap <- diagnoseColRow(x=xmat, bicResult = plaidmab, number = 1, nResamplings = 999,
  replace = TRUE)
diagnosticPlot(bootstrapOutput = Bootstrap) 	# plotting distribution of bootstrap replicates




