library(NlsyLinks)


### Name: RGroupSummary
### Title: Calculates summary statistics for each _R_elatedness Group in
###   the sample.
### Aliases: RGroupSummary
### Keywords: ACE

### ** Examples

library(NlsyLinks) #Load the package into the current R session.
dsLinks <- Links79PairExpanded  #Load the dataset from the NlsyLinks package.
dsLinks <- dsLinks[dsLinks$RelationshipPath=='Gen2Siblings', ]
oName_S1 <- "MathStandardized_S1" #Stands for Outcome1
oName_S2 <- "MathStandardized_S2" #Stands for Outcome2
dsGroupSummary <- RGroupSummary(dsLinks, oName_S1, oName_S2)
dsGroupSummary

#Should return: 
#      R Included PairCount   O1Mean   O2Mean O1Variance O2Variance O1O2Covariance Correlation
#1 0.250     TRUE      2718  94.6439  95.5990    169.650    207.842        41.0783    0.218761
#2 0.375     TRUE       139  92.6043  93.1655    172.531    187.081        40.4790    0.225311
#3 0.500     TRUE      5511  99.8940 100.1789    230.504    232.971       107.3707    0.463336
#4 0.750    FALSE         2 108.5000 106.0000    220.500     18.000        63.0000    1.000000
#5 1.000     TRUE        22  98.6364  95.5455    319.195    343.117       277.5887    0.838789
#  Determinant PosDefinite
#1     33573.0        TRUE
#2     30638.7        TRUE
#3     42172.2        TRUE
#4         0.0       FALSE
#5     32465.6        TRUE

#To get summary stats for the whole sample, create one large inclusive group.
dsLinks$Dummy <- 1
(dsSampleSummary <- RGroupSummary(dsLinks, oName_S1, oName_S2, rName="Dummy"))
                     
#Should return:
#  Dummy Included PairCount   O1Mean   O2Mean O1Variance O2Variance O1O2Covariance
#1     1     TRUE      8392 98.07162 98.56864    216.466   229.2988       90.90266
#  Correlation Determinant PosDefinite
#1   0.4080195     41372.1        TRUE
###
### ReadCsvNlsy79
###
## Not run: 
##D filePathGen2 <- "~/Nlsy/Datasets/gen2-birth.csv"
##D ds <- ReadCsvNlsy79Gen2(filePath=filePathGen2)
## End(Not run)




