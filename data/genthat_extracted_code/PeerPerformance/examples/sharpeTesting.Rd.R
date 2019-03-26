library(PeerPerformance)


### Name: sharpeTesting
### Title: Testing the difference of Sharpe ratios
### Aliases: sharpeTesting
### Keywords: htest

### ** Examples

## Load the data (randomized data of monthly hedge fund returns)
data("hfdata")
x = hfdata[,1]
y = hfdata[,2]

## Run Sharpe testing (asymptotic)
ctr = list(type = 1)
out = sharpeTesting(x, y, control = ctr)
print(out)
  
## Run Sharpe testing (asymptotic hac)
ctr = list(type = 1, hac = TRUE)
out = sharpeTesting(x, y, control = ctr)
print(out)
  
## Run Sharpe testing (iid bootstrap)
set.seed(1234)
ctr = list(type = 2, nBoot = 250)
out = sharpeTesting(x, y, control = ctr)
print(out)
  
## Run Sharpe testing (circular bootstrap)
set.seed(1234)
ctr = list(type = 2, nBoot = 250, bBoot = 5)
out = sharpeTesting(x, y, control = ctr)
print(out)



