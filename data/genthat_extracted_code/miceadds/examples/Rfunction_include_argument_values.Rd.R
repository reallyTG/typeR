library(miceadds)


### Name: Rfunction_include_argument_values
### Title: Utility Functions for Writing R Functions
### Aliases: Rfunction_include_argument_values
###   Rfunction_output_list_result_function Rfunction
###   Rcppfunction_remove_classes Rcppfunction

### ** Examples

#############################################################################
# EXAMPLE 1: Toy examples
#############################################################################

##**** extend missing arguments

string <- "
          mice.impute.2l.pls2(y, ry, x, type, pls.facs=pls.facs  ))
          "
cat( miceadds::Rfunction_include_argument_values(string) )
  ##    mice.impute.2l.pls2( y=y, ry=ry, x=x, type=type, pls.facs=pls.facs )

##**** assignment to objects as entries in a list

string <- "
          list( vname=vname, p, type=type, data=data, levels_id )
          "
cat( miceadds::Rfunction_output_list_result_function( string ) )
  ##
  ##  vname <- res$vname
  ##  p <- res$p
  ##  type <- res$type
  ##  data <- res$data
  ##  levels_id <- res$levels_id


string <- "
arma::colvec miceadds_rcpp_rtnorm2( arma::colvec mu,
            double sigma0, arma::colvec lower, arma::colvec upper,
            double minval, double maxval)
    "

cat( miceadds::Rcppfunction_remove_classes(string, maxlen=70) )
cat( miceadds::Rcppfunction_remove_classes(string, maxlen=70, remove=FALSE) )



