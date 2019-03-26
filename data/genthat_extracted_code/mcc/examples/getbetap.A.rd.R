library(mcc)


### Name: getbetap.A
### Title: Momoent Corrected Correlation
### Aliases: getbetap.A

### ** Examples

set.seed(1)
m=300
n=30
x=matrix(rnorm(m*n),m,n)
y=c(rep(1,15),rep(2,15))
z=c(rep(1,25),rep(2,5))
output=getbetap.A(getAmoment(x,y,z),A=NULL,fix.obs=FALSE)
#names(output)
#[1] "twosidedp"    "rightp"       "leftp"        "pdouble"      "chebyshev.p" 
#[6] "pt"           "lowest.alpha"



