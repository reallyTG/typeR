library(RNentropy)


### Name: RN_calc
### Title: RN_calc
### Aliases: RN_calc
### Keywords: RNentropy Run

### ** Examples

data("RN_Brain_Example_tpm", "RN_Brain_Example_design")
#compute statistics and p-values (considering only a subset of genes due to
#examples running time limit of CRAN)
Results <- RN_calc(RN_Brain_Example_tpm[1:10000,], RN_Brain_Example_design)

## The function is currently defined as

function(X, design = NULL)
{
  if(is.null(design))
  {
    design <- .RN_default_design(sum(sapply(X, is.numeric)))
  }
  
	Results <- list(expr = X, design = design)

	GPV <- RN_calc_GPV(X, bind = FALSE)
	LPV <- RN_calc_LPV(X, design = design, bind = FALSE)	

	TABLE = cbind(X,'---',GPV,'---',LPV)	

	Results$gpv <- GPV
	Results$lpv <- LPV
	Results$c_like <- TABLE
	Results$res <- cbind(X, GPV, LPV)
	
	return(Results)
}



