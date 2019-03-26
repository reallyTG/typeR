library(PeerPerformance)


### Name: msharpeTesting
### Title: Testing the difference of modified Sharpe ratios
### Aliases: msharpeTesting
### Keywords: htest

### ** Examples

## Load the data (randomized data of monthly hedge fund returns)
data("hfdata")
x = hfdata[,1]
y = hfdata[,2]

## Run modified Sharpe testing (asymptotic)
ctr = list(type = 1)
out = msharpeTesting(x, y, level = 0.95, control = ctr)
print(out)

## Run modified Sharpe testing (asymptotic hac)
ctr = list(type = 1, hac = TRUE)
out = msharpeTesting(x, y, level = 0.95, control = ctr)
print(out)
  
## Run modified Sharpe testing (iid bootstrap)
set.seed(1234)
ctr = list(type = 2, nBoot = 250)
out = msharpeTesting(x, y, level = 0.95, control = ctr)
print(out)

## Run modified Sharpe testing (circular bootstrap)
set.seed(1234)
ctr = list(type = 2, nBoot = 250, bBoot = 5)
out = msharpeTesting(x, y, level = 0.95, control = ctr)
print(out)



