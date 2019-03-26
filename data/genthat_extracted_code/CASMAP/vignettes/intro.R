## ----include = FALSE-----------------------------------------------------
#need to make vignette compile
library(Rcpp)
library(CASMAP)

## ----init 1--------------------------------------------------------------
library(CASMAP)

# An example using the "regionGWAS" mode
fastcmh <- CASMAP(mode="regionGWAS")      # initialise object
fastcmh$setTargetFWER(0.01)              # set target FWER

## ----init 2--------------------------------------------------------------
library(CASMAP)

# Another example, doing higher order epistasis search  with target FWER 0.01
facs <- CASMAP(mode="higherOrderEpistasis", alpha=0.01)      
print(facs)

## ----read data-----------------------------------------------------------
library(CASMAP)
fastcmh <- CASMAP(mode="regionGWAS")          # initialise object

datafile <- getExampleDataFilename()        # file name of example data
labelsfile <- getExampleLabelsFilename()   # file name of example labels
covfile <- getExampleCovariatesFilename() # file name of example covariates 

# read the data, labels and (optionally) covariate files
fastcmh$readFiles(genotype_file=getExampleDataFilename(),
                   phenotype_file=getExampleLabelsFilename(), 
                   covariate_file=getExampleCovariatesFilename())

#The object now displays that data files have been read, and covariates are used
print(fastcmh)

## ----data format, eval=FALSE---------------------------------------------
#  #to see where these data files are located on your local drive:
#  print(getExampleDataFilename())
#  
#  ## Example:
#  ## [1] "/path/to/pkgs/CASMAP/extdata/CASMAP_example_data_1.txt"

## ----execute-------------------------------------------------------------
# execute the algorithm (this may take some time)
fastcmh$execute()

## ----summary results-----------------------------------------------------
#get the summary results
summary_results <- fastcmh$getSummary()
print(summary_results)

## ----significant regions-------------------------------------------------
#get the significant regions
sig_regions <- fastcmh$getSignificantRegions()
print(sig_regions)

## ----significant reps----------------------------------------------------
#get the clustered representatives for the significant regions
sig_cluster_rep <- fastcmh$getSignificantClusterRepresentatives()
print(sig_cluster_rep)

## ----no covariates-------------------------------------------------------
## Another example of regionGWAS
fais <- CASMAP(mode="regionGWAS")      # initialise object

# read the data and labels, but no covariates
fais$readFiles(genotype_file=getExampleDataFilename(),
                  phenotype_file=getExampleLabelsFilename())

print(fais)

## ----encoding method-----------------------------------------------------
library(CASMAP)
fastcmh <- CASMAP(mode="regionGWAS")

#  using the dominant encoding (default)
fastcmh$readFiles(genotype_file=getExampleDataFilename(),
                   phenotype_file=getExampleLabelsFilename(), 
                   covariate_file=getExampleCovariatesFilename(),
                   encoding="dominant")

#  using the dominant encoding (default)
fastcmh$readFiles(genotype_file=getExampleDataFilename(),
                   phenotype_file=getExampleLabelsFilename(), 
                   covariate_file=getExampleCovariatesFilename(),
                   encoding="recessive")

