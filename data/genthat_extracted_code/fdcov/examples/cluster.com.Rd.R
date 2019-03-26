library(fdcov)


### Name: cluster.com
### Title: Functional data clustering via concentration inequalities
### Aliases: cluster.com

### ** Examples

## Not run: 
##D  # Load phoneme data 
##D  library(fds);
##D  # Setup data to be clustered
##D  dat  = rbind( t(aa$y[,1:20]),t(iy$y[,1:20]),t(sh$y[,1:20]) );
##D  # Cluster data into three groups
##D  clst = cluster.com(dat,grpCnt=3);
##D  matrix(clst,3,20,byrow=TRUE);
##D  
##D  # cluster groups of curves
##D  dat  = rbind( t(aa$y[,1:40]),t(iy$y[,1:40]),t(sh$y[,1:40]) );
##D  lab  = gl(30,4);
##D  # Cluster data into three groups
##D  clst = cluster.com(dat,labl=lab,grpCnt=3);
##D  matrix(clst,3,10,byrow=TRUE);
## End(Not run)
## Don't show: 
 # Load phoneme data 
 library(fds);
 # Setup data to be clustered
 dat  = rbind( t(aa$y[,1:5]),t(iy$y[,1:5]) )
 clst = cluster.com(dat);
## End(Don't show)



