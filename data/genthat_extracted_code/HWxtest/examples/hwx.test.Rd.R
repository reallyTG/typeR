library(HWxtest)


### Name: hwx.test
### Title: Test for HW by either full enumeration or Monte Carlo.
### Aliases: hwx.test

### ** Examples

# Data from Louis and Dempster 1987 Table 2 and Guo and Thompson 1992 Figure 2:
c <- c(0,3,1,5,18,1,3,7,5,2)
hwx.test(c)
# To see a histogram of the LLR statistic:
hwx.test(c, histobins=TRUE)
# For a histogram of the U statistic and other details of the result:
hwx.test(c, statName="U", histobins=TRUE, detail=3)




