library(RGBM)


### Name: consider_previous_information
### Title: Remember the intermediate inferred GRN while generating the
###   final inferred GRN
### Aliases: consider_previous_information

### ** Examples

## The function is currently defined as
function (A, A_prev) 
{
  #Utilize Past Information also to not remove true positives
  A_prev[A_prev==0] <- .Machine$double.eps;
  A_prev <- transform_importance_to_weights(A_prev);
  A[A==0] <- .Machine$double.eps;
  epsilon <- 1/log(1/.Machine$double.eps);
  A <- transform_importance_to_weights(A);
  A_final <- 2*A*A_prev/(A+A_prev);
  A_final <- A_final - epislon;
  A_final[A_final<0] <- 0.0;
  return(A_final);
}



