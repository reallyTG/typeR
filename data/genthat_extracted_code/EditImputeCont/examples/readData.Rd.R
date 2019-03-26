library(EditImputeCont)


### Name: readData
### Title: Read Data and Edit Rules
### Aliases: readData EditIn.data EditIn.data-class

### ** Examples

### option 1. import from text files ###

data(NestedEx)
makeDemoTxt(NestedEx)     # make demo textfiles from NestedEx dataset
 
D_obs1 = read.table("Demo_D_obs.txt", header = TRUE) 
  # The original data file has a header with variable names 
  # to be used in ratio edit description.
Ratio1 = read.table("Demo_Ratio_edit.txt", header = FALSE) 
Range1 = read.table("Demo_Range_edit.txt", header = FALSE) 
Balance1 = read.table("Demo_Balance_edit.txt", header = FALSE) 

data1 = readData(Y.original=D_obs1, ratio=Ratio1, range=Range1, 
balance=Balance1, eps.bal=0.6)

# print(data1$Edit.editmatrix)
# plot(data1$Edit.editmatrix)	  ## function of 'editrules' package

### option 2. Using the syntax of R package 'editrules' ###

data(NestedEx) ; D_obs2 = NestedEx$D.obs

Ratio2 <- editmatrix(c(
 "X1 <= 1096.63*X5", "X1 <= 2980.96*X7", "X1 <= 148.41*X8", "X1 <= 7.39*X9",
 "X5 <= 0.37*X1", "X5 <= 54.60*X7", "X5 <= 2.72*X8", "X5 <= 0.14*X9",
 "X7 <= 0.14*X1", "X7 <= 1.65*X5", "X7 <= 7.39*X8", "X7 <= 0.05*X9",
 "X8 <= 1.65*X1", "X8 <= 54.60*X5", "X8 <= 403.43*X7", "X8 <= 1.65*X9",
 "X9 <= 20.09*X1", "X9 <= 403.43*X5", "X9 <= 13359.73*X7", "X9 <= 148.41*X8"
))
Range2 <- editmatrix(c(
 "X1 >= 2", "X2 <= 1.2e+06", "X11 >= 0.002", "X11 <= 1.2e+04"
))
Balance2 <- editmatrix(c(
 "X1 == X2+X3+X4", "X5 == X6 + 0.4*X10 + 0.6*X11", "X7 == 0.4*X10 + 0.6*X11"
))

data2 = readData(D_obs2, Ratio2, Range2, Balance2)

# print(data2$Edit.editmatrix)
  # Note: data2 is equivalent to data1
# plot(data2$Edit.editmatrix)	  ## function of 'editrules' package



