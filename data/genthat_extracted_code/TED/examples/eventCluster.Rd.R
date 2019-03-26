library(TED)


### Name: eventCluster
### Title: Cluster detected events
### Aliases: eventCluster

### ** Examples

##################################
#   An artificial example
##################################
set.seed(123)
n <- 128
types <- c('box','rc','cr','sine')
shapes <- matrix(NA,20,n)
for (i in 1:20){
  shapes[i,] <- cbfs(type=types[sample(1:4,1)])
}
whitenoise <- ts2mat(rnorm(128*20),128)
# generate x which randomly combine the four types of events with each two of them
# separated by noise
x <- c(rnorm(128),t(cbind(shapes,whitenoise)))
## Not run: 
##D plot(x,ty='l')
## End(Not run)
# specify a sliding window size
w <- 128
# specify a significant level
alpha <- 0.05
# event detection
## Not run: 
##D events <- eventDetection(x,w,'white',parallel=FALSE,alpha, 'art')
##D # clustering
##D cc <- eventCluster(events,4)
##D myclkm <- cc$cl
## End(Not run)
##################################
#   CASES-99 dataset (9.5m)
##################################
# a sliding window length chosen by the user
w <- 120
# specify a significant level
alpha <- 0.05
data(CASES99)
## Not run: 
##D CASESevents <- eventDetection(CASES99,w,'red',parallel=FALSE,0.05,'real')
##D cc <- eventCluster(CASESevents,3)
##D cc$center
##D myclkm <- cc$cl
##D # visualise the clustering in 2-dimension PCA space
##D pc.cr <- cc$pca
##D pca.dim1 <- pc.cr$scores[,1]
##D pca.dim2 <- pc.cr$scores[,2]
##D plot(pca.dim1,pca.dim2,col=myclkm+1,main='PCA plots for k-means clustering',pch=16)
## End(Not run)



