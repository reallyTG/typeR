library(selfea)


### Name: get_statistics_from_file
### Title: get_statistics_from_file
### Aliases: get_statistics_from_file

### ** Examples

library(selfea)

## For this example we will import Gregori data
## Josep Gregori, Laura Villareal, Alex Sanchez, Jose Baselga, Josep Villanueva (2013).
## An Effect Size Filter Improves the Reproducibility
## in Spectral Counting-based Comparative Proteomics.
## Journal of Proteomics, DOI http://dx.doi.org/10.1016/j.jprot.2013.05.030')

## Description:
## Each sample consists in 500ng of standard yeast lisate spiked with
## 100, 200, 400 and 600fm of a mix of 48 equimolar human proteins (UPS1, Sigma-Aldrich).
## The dataset contains a different number of technical replimessagees of each sample

## Import Gregori data
data(example_data1)
df_contrast <- example_data
df_group <- example_group

## Write Gregori data to use 'get_statistics_from_file' function
write.csv(df_contrast,"expression.csv",row.names=FALSE)
write.csv(df_group,"group.csv",row.names=FALSE)

## Get statistics
list_result <- get_statistics_from_file("expression.csv","group.csv","fdr")

## Get significant features (alpha >= 0.05 and power >= 0.90)
significant_qpf <- top_table(list_result,pvalue=0.05,power_desired=0.90,method='QPF')



