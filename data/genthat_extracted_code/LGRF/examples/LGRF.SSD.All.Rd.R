library(LGRF)


### Name: LGRF.SSD.All
### Title: LGRF tests for multiple regions/genes using SSD format files
### Aliases: LGRF.SSD.All
### Keywords: plink_test_all

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

## Test all regions
# out_all<-LGRF.SSD.All(SSD.INFO, result.null)

# Example result
# out.all$results
#      SetID   P.value N.Marker
# 1  GENE_01 0.6568851       94
# 2  GENE_02 0.1822183       84
# 3  GENE_03 0.3836986      108
# 4  GENE_04 0.1265337      101
# 5  GENE_05 0.3236089      103
# 6  GENE_06 0.9401741       94
# 7  GENE_07 0.1043820      104
# 8  GENE_08 0.6093275       96
# 9  GENE_09 0.6351147      100
# 10 GENE_10 0.5631549      100

## Test all regions, and compare with GEE based MinP test
# out_all<-LGRF.SSD.All(SSD.INFO, result.null,MinP.compare=T)

# Example result
# out.all$results
#      SetID P.value P.value.MinP N.Marker
# 1  GENE_01 0.62842       1.0000       94
# 2  GENE_02 0.06558       0.2718       84
# 3  GENE_03 0.61795       1.0000      108
# 4  GENE_04 0.39667       0.7052      101
# 5  GENE_05 0.17371       0.5214      103
# 6  GENE_06 0.90104       1.0000       94
# 7  GENE_07 0.10143       0.1188      104
# 8  GENE_08 0.78082       0.3835       96
# 9  GENE_09 0.21966       0.5364      100
# 10 GENE_10 0.25468       0.3527      100




