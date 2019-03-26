library(Temporal)


### Name: dLogIncGamma
### Title: Derivatives of the Log Incomplete Gamma Function
### Aliases: dLogIncGamma

### ** Examples

# First partial in shape at (a=1,s=1)
dLogIncGamma(a=1,s=1,Dirn="a",Order=1);
# Second partial in lower limit at (a=1,s=1)
dLogIncGamma(a=1,s=1,Dirn="s",Order=2);
# Mixed partial at (a=1,s=1);
dLogIncGamma(a=1,s=1,Dirn="as");



