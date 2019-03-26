library(testforDEP)


### Name: testforDEP
### Title: Test dependence for two data
### Aliases: testforDEP

### ** Examples

set.seed(123)
x = runif(100, 0, 1)
y = runif(100, 0, 1)

testforDEP(x, y, test = "SPEARMAN", p.opt = "MC",
           num.MC = 10000, BS.CI = 0, set.seed = TRUE)


#An object of class "testforDEP_result"
#Slot "TS":
#[1] 59.54311

#Slot "p_value":
#[1] 0.6735326

#Slot "CI":
#list()




