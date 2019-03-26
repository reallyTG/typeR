### R code from vignette source 'parameter_estimation-knitr.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: parameter_estimation-knitr.Rnw:58-70
###################################################
library(MetaLandSim)
data(occ.landscape)
data(occ.landscape2)

#Using data with only one snapshot of the occupancy status
param1 <- parameter.estimate (occ.landscape, method='Rsnap_1')
param1

#Using data with more than one snapshot of the occupancy status
param2 <- parameter.estimate (occ.landscape2, method='Rsnap_x', 
nsnap=10)
param2


###################################################
### code chunk number 2: parameter_estimation-knitr.Rnw:78-105 (eval = FALSE)
###################################################
## library(MetaLandSim)
## data(occ.landscape2)
## 
## #First, generate the files to be the input of the application
## parameter.estimate (occ.landscape2, method='MCsim')
## 
## #run the application mcm.exe from Moilanen (1999). 
## #Previously read the readme.txt file #available with the 
## #application. 
## #Consider particularly the three step procedure for estimation, 
## #using nonlinear regression (Hanski, 1994) to produce priors 
## #for the Monte Carlo simulation). In the command line (first put 
## #the application and the files in a folder with no spaces 
## #in the name. 
## #e.g.: 'C:/moilanen/'):
## 
## #mce.exe inputMCsim.dat inputMCsim
## 
## #Or, from R:
## 
## system('mce.exe inputMCsim.dat inputMCsim')
## 
## 
## #After, create a data frame, with create.parameter.df, 
## #using the estimated parameters:
## param3 <- create.parameter.df(alpha, x, y, e)
## 


###################################################
### code chunk number 3: parameter_estimation-knitr.Rnw:114-154 (eval = FALSE)
###################################################
## library(MetaLandSim)
## data(occ.landscape2)
## 
## #Method 'rescue'
## parameter.estimate (occ.landscape2, method='rescue')
## 
## #run the application file fmetapop_rescue.exe from 
## #the command line (first put the application and the 
## #files in a folder with no spaces in the name. 
## #e.g.: 'C:/terbraak/'):
## 
## #fmetapop_rescue input_rescue
## 
## #Or, from R:
## 
## system('fmetapop_rescue input_rescue')
## 
## #After, create a data frame, with create.parameter.df, 
## #using the estimated parameters:
## #param4 <- create.parameter.df(alpha, x, y, e)
## 
## #Method 'norescue'
## parameter.estimate (occ.landscape2, method='norescue')
## 
## #run the application file fmetapop_norescue.exe from 
## #the command line (first put the application and the 
## #files in a folder with no spaces in the name. 
## #e.g.: 'C:/terbraak/'):
## 
## #fmetapop_norescue input_norescue
## 
## #Or, from R:
## 
## system('fmetapop_norescue input_norescue')
## 
## #After, create a data frame, with create.parameter.df, 
## #using the estimated parameters:
## 
## param5 <- create.parameter.df(alpha, x, y, e)
## 


