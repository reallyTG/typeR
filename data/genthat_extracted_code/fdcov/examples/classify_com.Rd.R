library(fdcov)


### Name: classifier-com
### Title: Functional data classifier via concentration inequalities
### Aliases: classifier-com classif.com predict.classif.com

### ** Examples

## Not run: 
##D  library(fds);
##D  # Setup training data
##D  dat1 = rbind( 
##D    t(aa$y[,1:100]), t(ao$y[,1:100]), t(dcl$y[,1:100]), 
##D    t(iy$y[,1:100]), t(sh$y[,1:100]) 
##D  );
##D  # Setup testing data
##D  dat2 = rbind( 
##D    t(aa$y[,101:400]), t(ao$y[,101:400]), t(dcl$y[,101:400]), 
##D    t(iy$y[,101:400]), t(sh$y[,101:400]) 
##D  );
##D  
##D  datgrp = gl(5,100);
##D  clCom = classif.com( datgrp, dat1 );
##D  grp = predict( clCom, dat2, LOADING=TRUE );
##D  acc = c(
##D    sum( grp[1:300]==1 ), sum( grp[301:600]==2 ), sum( grp[601:900]==3 ), 
##D    sum( grp[901:1200]==4 ), sum( grp[1201:1500]==5 )
##D  )/300;
##D  print(rbind(gl(5,1),signif(acc,3)));
## End(Not run)
## Don't show: 
 library(fds);
 # Setup training data
 dat1 = rbind( 
   t(aa$y[,1:5]), t(ao$y[,1:5]), t(dcl$y[,1:5]) 
 );
 # Setup testing data
 dat2 = rbind( 
   t(aa$y[,11:15]), t(ao$y[,11:15]), t(dcl$y[,11:15])
 );
 
 datgrp = gl(3,5);
 clCom = classif.com( datgrp, dat1 );
 grp = predict( clCom, dat2 );
## End(Don't show)



