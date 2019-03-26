library(lmtest)


### Name: unemployment
### Title: Unemployment Data
### Aliases: unemployment
### Keywords: datasets

### ** Examples

data(unemployment)

## data transformation
myunemployment <- window(unemployment, start=1895, end=1956)
time <- 6:67

## page 144, fit Rea OLS model
## last line in Table 6.12

modelRea <- UN ~ log(m/p) + log(G) + log(x) + time
lm(modelRea, data = myunemployment)
## coefficients of logged variables differ by factor 100

## page 143, fit test statistics in table 6.11
##############################################

if(require(strucchange, quietly = TRUE)) {
## Chow 1941
sctest(modelRea, point=c(1940,1), data=myunemployment, type="Chow") }

## Breusch-Pagan
bptest(modelRea, data=myunemployment, studentize=FALSE)
bptest(modelRea, data=myunemployment)

## RESET (a)-(b)
reset(modelRea, data=myunemployment)
reset(modelRea, power=2, type="regressor", data=myunemployment)

## Harvey-Collier
harvtest(modelRea, order.by = ~ log(m/p), data=myunemployment)
harvtest(modelRea, order.by = ~ log(G), data=myunemployment)
harvtest(modelRea, order.by = ~ log(x), data=myunemployment)
harvtest(modelRea, data=myunemployment)

## Rainbow
raintest(modelRea, order.by = "mahalanobis", data=myunemployment)



