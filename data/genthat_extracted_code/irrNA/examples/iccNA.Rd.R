library(irrNA)


### Name: iccNA
### Title: Intraclass correlation coefficients (ICCs) - generalized for
###   randomly incomplete datasets
### Aliases: iccNA

### ** Examples

# Example 1:
data(ConsistNA)
# ConsistNA exhibits missing values, a perfect consistency, and 
# a moderate agreement between raters:
ConsistNA
# Common ICC-algorithms fail, since each row as well as each 
# column of ConsistNA exhibits unfilled cells and these missing 
# data are omitted column-wise or row-wise:
library(irr)
icc(ConsistNA, r0=0.3)
# Ebel's (1951) method for computing ICC(1) and ICC(k) that is 
# implemented in iccNA can cope with such data without an 
# omission or an imputation of missing values, but still can 
# not depict the raters' interdependency...
iccNA(ConsistNA, rho0=0.3)
# ...but generalizations of Ebel's method for the twoway ICCs 
# are able to assess moderate agreement (ICC(A,1) and ICC(A,k)) 
# and perfect consistency (ICC(C,1) and ICC(C,k)), assuming that 
# the data were acquired under case 2 or case 3, see Details in 
# the Help file.
#
# Example 2:
data(IndepNA)
# IndepNA exhibits missing values and zero variance between 
# the raters just as well as between the objects:
IndepNA
# Again, common ICC-algorithms fail:
icc(IndepNA)
# But iccNA is able to include all available data in its 
# calculation and thereby to show the perfect independence of 
# the ratings:
iccNA(IndepNA)
#
# Example 3:
# The example provided by Ebel (1951, Tables 2 and 3):
# data(Ebel51)
Ebel51
# iCCNA achieves to include all available ratings and to assess 
# twoway ICCs, assuming that the data were acquired under 
# case 2 or case 3:
iccNA(Ebel51, detail=TRUE)



