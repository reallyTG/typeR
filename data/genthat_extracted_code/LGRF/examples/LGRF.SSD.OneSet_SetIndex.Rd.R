library(LGRF)


### Name: LGRF.SSD.OneSet_SetIndex
### Title: LGRF tests for a single region/gene using SSD format files
### Aliases: LGRF.SSD.OneSet_SetIndex
### Keywords: plink_test_single

### ** Examples


# * Since the Plink data files used here are hard to be included in a R package, 
# The usage is marked by "#" to pass the package check.

#library(LGRF)

##############################################

# Plink data files: File.Bed, File.Bim, File.Fam
# Files defining the sets: File.SetID, File.SSD, File.Info
# For longitudinal data, outcome and covariates are saved in a separate file: Y, time, X. 
# Null model was fitted using function null.LGRF.

# Create the MW File
# File.Bed<-"./example.bed"
# File.Bim<-"./example.bim"
# File.Fam<-"./example.fam"
# File.SetID<-"./example.SetID"
# File.SSD<-"./example.SSD"
# File.Info<-"./example.SSD.info"

# Generate SSD file
# To use binary ped files, you have to generate SSD file first.
# If you already have a SSD file, you do not need to call this function.
# Generate_SSD_SetID(File.Bed, File.Bim, File.Fam, File.SetID, File.SSD, File.Info)

# SSD.INFO<-Open_SSD(File.SSD, File.Info)
# Number of samples
# SSD.INFO$nSample
# Number of Sets
# SSD.INFO$nSets

## Fit the null model
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by p matrix
# time: describe longitudinal structure, n by 2 matrix
# result.null<-null.LGRF(Y,time,X=cbind(X,time[,2]))

# *Please note that the second column of time should be included as a covairate if
# the gene by time interaction effect will be incorperated. 

## Test a single region
# out_single<-LGRF.SSD.OneSet_SetIndex(SSD.INFO=SSD.INFO, SetIndex=1, 
# result.null=result.null, MinP.compare=F)

# Example result
# $p.value
# [1] 0.6284

# $n.marker
# [1] 94

## Test a single region, and compare with GEE based MinP test
# out_single<-LGRF.SSD.OneSet_SetIndex(SSD.INFO=SSD.INFO, SetIndex=1, 
# result.null=result.null,MinP.compare=T)

# $p.value
#       LGRF MinP
# [1,] 0.6284    1

# $n.marker
# [1] 94




