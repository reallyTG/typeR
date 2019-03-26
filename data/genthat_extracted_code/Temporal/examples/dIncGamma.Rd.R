library(Temporal)


### Name: dIncGamma
### Title: Derivatives of the Incomplete Gamma Function
### Aliases: dIncGamma

### ** Examples

# First partial in shape at (a=1,s=1)
dIncGamma(a=1,s=1,Dirn="a",Order=1);
# Second partial in lower limit at (a=1,s=1)
dIncGamma(a=1,s=1,Dirn="s",Order=2);
# Mixed partial at (a=1,s=1);
dIncGamma(a=1,s=1,Dirn="as");



