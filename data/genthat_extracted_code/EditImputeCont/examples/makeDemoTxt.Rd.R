library(EditImputeCont)


### Name: makeDemoTxt
### Title: Make Demo Text Files
### Aliases: makeDemoTxt

### ** Examples

data(NestedEx)
makeDemoTxt(NestedEx)
 
D_obs1 = read.table("Demo_D_obs.txt", header = TRUE)  
  # The original data file has a header with variable names 
  # to be used in ratio edit description.
Ratio1 = read.table("Demo_Ratio_edit.txt", header = FALSE) 
Range1 = read.table("Demo_Range_edit.txt", header = FALSE) 
Balance1 = read.table("Demo_Balance_edit.txt", header = FALSE) 

data1 = readData(D_obs1, Ratio1, Range1, Balance1)



