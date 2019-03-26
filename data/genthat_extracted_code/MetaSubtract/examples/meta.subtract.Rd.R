library(MetaSubtract)


### Name: meta.subtract
### Title: Subtracts GWAS results from one or more cohorts from the
###   meta-GWAS results
### Aliases: meta.subtract
### Keywords: Correct meta-GWAS results Leave-one-out

### ** Examples

metafile="meta_results.txt"
cohortfiles=c("cohort1_results.txt","cohort2_results.txt","cohort3_results.txt")
# Subtract summary statistics of the two cohorts from the meta summary statistics in metafile.
# Genomic control correction of the imported meta summary statistics will be undone using 
# lambda.meta. Genomic control will be applied to the corrected meta summary statistics 
# (gc_meta=TRUE by default) based on a lambda derived from the new meta summary statistics 
# (calculate_lambda.meta=TRUE by default). The cohorts summary statistics will always be first 
# corrected for genomic control before subtracting them from the meta summary statistics. By 
# default, the lambda will be calculated from the data (calculate_lambdas.cohort=TRUE by default).
m1<-meta.subtract(metafile=metafile, cohortfiles=cohortfiles, lambda.meta=1.046, dir=tempdir())
head(m1)

# If you would like pre-set genomic control lambdas (e.g. in case you use only part of the data), 
# set calculate_lambda.meta=FALSE and calculate_lambdas.cohort=FALSE and define the 
# lambda for the meta summary statistics by lambda.meta, and for the cohort(s) by lambda.cohorts.
m2<-meta.subtract(metafile=metafile, cohortfiles=cohortfiles, lambda.meta=1.046, 
      lambdas.cohort=c(1.0012,1.03), calculate_lambda.meta=FALSE, calculate_lambdas.cohort=FALSE, 
	  dir=tempdir())
head(m2)

# If you do not want to apply genomic control, set gc_meta=FALSE,  
# calculate_lambda.meta=FALSE and calculate_lambdas.cohort=FALSE.
# lambda.meta=1 and lambda.cohorts=c(1,1) are default values.
m3<-meta.subtract(metafile=metafile, cohortfiles=cohortfiles, gc_meta=FALSE, 
      calculate_lambda.meta=FALSE, calculate_lambdas.cohort=FALSE, 
	  dir=tempdir())
head(m3)



