library(bootSVD)


### Name: bootSVD
### Title: Calculates bootstrap distribution of PCA (i.e. SVD) results
### Aliases: bootSVD

### ** Examples

#use small n, small B, for a quick illustration
set.seed(0)
Y<-simEEG(n=100, centered=TRUE, wide=TRUE)
b<-bootSVD(Y, B=50, K=2, output=
 	c('initial_SVD', 'HD_moments', 'full_HD_PC_dist',
 	'HD_percentiles'), verbose=interactive())

#explore results
matplot(b$initial_SVD$V[,1:4],type='l',main='Fitted PCs',lty=1)
legend('bottomright',paste0('PC',1:4),col=1:4,lty=1,lwd=2)

######################
# look specifically at 2nd PC
k<-2

######
#looking at HD variability

#plot several draws from bootstrap distribution
VsByK<-reindexMatricesByK(b$full_HD_PC_dist)
matplot(t(VsByK[[k]][1:20,]),type='l',lty=1,
		main=paste0('20 Draws from bootstrap\ndistribution of HD PC ',k))

#plot pointwise CIs
matplot(b$HD_moments$momentCI[[k]],type='l',col='blue',lty=1,
		main=paste0('CIs For HD PC ',k))
matlines(b$HD_percentiles[[k]],type='l',col='darkgreen',lty=1)
lines(b$initial_SVD$V[,k])
legend('topright',c('Fitted PC','Moment CIs','Percentile CIs'),
		lty=1,col=c('black','blue','darkgreen'))
abline(h=0,lty=2,col='darkgrey')

######
# looking at LD variability

# plot several draws from bootstrap distribution
AsByK<-reindexMatricesByK(b$full_LD_PC_dist)
matplot(t(AsByK[[k]][1:50,]),type='l',lty=1,
		main=paste0('50 Draws from bootstrap\ndistribution of LD PC ',k),
		xlim=c(1,10),xlab='PC index (truncated)')

# plot pointwise CIs
matplot(b$LD_moments$momentCI[[k]],type='o',col='blue',
		lty=1,main=paste0('CIs For LD PC ',k),xlim=c(1,10),
		xlab='PC index (truncated)',pch=1)
matlines(b$LD_percentiles[[k]],type='o',pch=1,col='darkgreen',lty=1)
abline(h=0,lty=2,col='darkgrey')
legend('topright',c('Moment CIs','Percentile CIs'),lty=1,
		pch=1,col=c('blue','darkgreen'))
#Note: variability is mostly due to rotations with the third and fourth PC.

# Bootstrap eigenvalue distribution
dsByK<-reindexVectorsByK(b$d_dist)
boxplot(dsByK[[k]]^2,main=paste0('Covariance Matrix Eigenvalue ',k),
		ylab='Bootstrap Distribution',
		ylim=range(c(dsByK[[k]]^2,b$initial_SVD$d[k]^2)))
points(b$initial_SVD$d[k]^2,pch=18,col='red')
legend('bottomright','Sample Value',pch=18,col='red')


##################
#Example with ff input
library(ff)
Yff<-as.ff(Y, pattern='Y_')
# If desired, change options in 'ff' package to
# adjust the size of matrix blocks held in RAM.
# For example:
# options('ffbatchbytes'=100000)
ff_dir<-tempdir()
pattern_V <- paste0(ff_dir,'/V_')
pattern_Vb <- paste0(ff_dir,'/Vb_')
bff <- bootSVD(Yff, B=50, K=2, output=c('initial_SVD', 'HD_moments',
 	'full_HD_PC_dist', 'HD_percentiles'), pattern_V= pattern_V,
 	pattern_Vb=pattern_Vb, verbose=interactive())


# Note that elements of full_HD_PC_dist and initial_SVD
# have class 'ff'
lapply(bff,function(x) class(x[[1]]))
#Show some results of bootstrap draws
plot(bff$full_HD_PC_dist[[1]][,k],type='l')
#Reindexing by K will create a new set of ff files.
VsByKff<-reindexMatricesByK(bff$full_HD_PC_dist,
 	pattern=paste0(ff_dir,'/Vk_'))
physical(bff$full_HD_PC_dist[[1]])$filename
physical(VsByKff[[1]])$filename
matplot(t(VsByKff[[k]][1:10,]),type='l',lty=1,
main=paste0('Bootstrap Distribution of PC',k))


# Saving and moving results:
saveRDS(bff,file=paste0(ff_dir,'/bff.rds'))
close(bff$initial_SVD$V)
physical(bff$initial_SVD$V)$filename
# If the 'ff' files on disk are moved or renamed,
# this filename attribute can be changed:
old_ff_path <- physical(bff$initial_SVD$V)$filename
new_ff_path <- paste0(tempdir(),'/new_V_file.ff')
file.rename(from= old_ff_path, to= new_ff_path)
physical(bff$initial_SVD$V)$filename <- new_ff_path
matplot(bff$initial_SVD$V[,1:4],type='l',lty=1)



