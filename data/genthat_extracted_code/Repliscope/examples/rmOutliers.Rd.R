library(Repliscope)


### Name: rmOutliers
### Title: A function to remove outliers from the "score" column of a
###   supplied bed dataframe There are three methods: max, IQR and median.
###   Max is used to remove 1 or more maximum values; IQR uses
###   interquartile range to detect outliers, while median method can be
###   used to remove data based on genome-wide median.
### Aliases: rmOutliers
### Keywords: BED bioinformatics genomics outliers

### ** Examples

bedDF <- rmOutliers(W303_S,method="max",n=2) ## removes 2 rows of data containing 3 top values
bedDF <- rmOutliers(W303_S,method="IQR",range=3) ## removes datapoints outside 3 x IQR above the 3rd
 # and below the 1st IQR.
bedDF <- rmOutliers(W303_S,method="median",loLim=0.25,hiLim=2) # removes datapoints that are lower
 # than 0.25 x genome median or above 2 x genome median.



