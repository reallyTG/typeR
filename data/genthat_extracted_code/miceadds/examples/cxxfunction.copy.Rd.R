library(miceadds)


### Name: cxxfunction.copy
### Title: R Utilities: Copy of an 'Rcpp' File
### Aliases: cxxfunction.copy
### Keywords: R utilities

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Rcpp code logistic distribution
##D #############################################################################
##D 
##D library(Rcpp)
##D library(inline)
##D 
##D # define Rcpp file
##D code1 <- "
##D     // input array A
##D     Rcpp::NumericMatrix AA(A);
##D     // Rcpp::IntegerVector dimAA(dimA);
##D     int nrows=AA.nrow();
##D     int ncolumns=AA.ncol();
##D     Rcpp::NumericMatrix Alogis(nrows,ncolumns)  ;
##D     // compute logistic distribution
##D     for (int ii=0; ii<nrows; ii++){
##D         Rcpp::NumericVector h1=AA.row(ii) ;
##D         Rcpp::NumericVector res=plogis( h1 ) ;
##D         for (int jj=0;jj<ncolumns;jj++){
##D             Alogis(ii,jj)=res[jj] ;
##D                         }
##D                     }
##D     return( wrap(Alogis) );
##D     "
##D # compile Rcpp code
##D fct_rcpp <- inline::cxxfunction( signature( A="matrix"), code1,
##D               plugin="Rcpp", verbose=TRUE )
##D # copy function and save it as object 'calclogis'
##D name <- "calclogis"  # name of the function
##D cxxfunction.copy( cppfct=fct_rcpp, name=name )
##D # function is available as object named as name
##D Reval( paste0( name, " <- fct_rcpp " ) )
##D # test function
##D m1 <- outer( seq( -2, 2, len=10 ), seq(-1.5,1.5,len=4) )
##D calclogis(m1)
##D     
## End(Not run)



