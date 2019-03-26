library(selfea)


### Name: get_statistics_from_dataFrame
### Title: get_statistics_from_dataFrame
### Aliases: get_statistics_from_dataFrame

### ** Examples

library(selfea)

## Test selfea for single protein expression
values <- c(6,8,10,29,26,22)
groups <- c("U200","U200","U200","U600","U600","U600")
experiments <- c("exp1","exp2","exp3","exp4","exp5","exp6")

df_expr <- data.frame(ID="Protein_1",exp1=6,exp2=8,exp3=10,exp4=29,exp5=26,exp6=22)
df_group <- data.frame(Col_Name=experiments,Group=groups)
list_result <- get_statistics_from_dataFrame(df_expr,df_group)
top_table(list_result)

## For this example we will import Gregori data
## Josep Gregori, Laura Villareal, Alex Sanchez, Jose Baselga, Josep Villanueva (2013).
## An Effect Size Filter Improves the Reproducibility
## in Spectral Counting-based Comparative Proteomics.
## Journal of Proteomics, DOI http://dx.doi.org/10.1016/j.jprot.2013.05.030')

## Description:
## Each sample consists in 500ng of standard yeast lisate spiked with
## 100, 200, 400 and 600fm of a mix of 48 equimolar human proteins (UPS1, Sigma-Aldrich).
## The dataset contains a different number of technical replimessagees of each sample

## import Gregori data
data(example_data1)
df_contrast <- example_data
df_group <- example_group

## Get statistics through 'get_statistics_from_dataFrame' function
list_result <- get_statistics_from_dataFrame(df_contrast,df_group)

## Get significant features (alpha >= 0.05 and power >= 0.90)
significant_qpf <- top_table(list_result,pvalue=0.05,power_desired=0.90,method='QPF')



