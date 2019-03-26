library(CASMAP)


### Name: CASMAP-class
### Title: Constructor for CASMAP class object.
### Aliases: CASMAP-class CASMAP

### ** Examples


## An example using the "regionGWAS" mode
fastcmh <- CASMAP(mode="regionGWAS")      # initialise object

datafile <- getExampleDataFilename()      # file name of example data
labelsfile <- getExampleLabelsFilename()  # file name of example labels
covfile <- getExampleCovariatesFilename() # file name of example covariates 

# read the data, labels and covariate files
fastcmh$readFiles(genotype_file=getExampleDataFilename(),
                  phenotype_file=getExampleLabelsFilename(), 
                  covariate_file=getExampleCovariatesFilename() )

# execute the algorithm (this may take some time)
fastcmh$execute()

#get the summary results
summary_results <- fastcmh$getSummary()

#get the significant regions
sig_regions <- fastcmh$getSignificantRegions()

#get the clustered representatives for the significant regions
sig_cluster_rep <- fastcmh$getSignificantClusterRepresentatives()


## Another example of regionGWAS
fais <- CASMAP(mode="regionGWAS")      # initialise object

# read the data and labels, but no covariates
fastcmh$readFiles(genotype_file=getExampleDataFilename(),
                  phenotype_file=getExampleLabelsFilename())


## Another example, doing higher order epistasis search
facs <- CASMAP(mode="higherOrderEpistasis")      # initialise object




