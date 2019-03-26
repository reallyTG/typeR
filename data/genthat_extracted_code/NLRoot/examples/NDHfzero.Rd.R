library(NLRoot)


### Name: NDHfzero
### Title: Newton Downhill Method
### Aliases: NDHfzero
### Keywords: ~kwd1 ~kwd2

### ** Examples
f<-function(x){x^3-x-1};f1<-function(x){3*x^2-1};
NDHfzero(f,f1,2)

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (f, f1, x0 = 0, num = 1000, eps = 1e-05, eps1 = 1e-05) 
{
    a = x0
    b = a - f(a)/f1(a)
    i = 0
    while ((abs(b - a) > eps)) {
        c = 1
        j = 0
        while (abs(f(b)) >= abs(f(a))) {
            b = a - c * f(a)/f1(a)
            j = j + 1
            c = 1/(2^j)
        }
        a = b
        b = a - f(a)/f1(a)
        c = 1
        j = 0
        while (abs(f(b)) >= abs(f(a))) {
            b = a - c * f(a)/f1(a)
            j = j + 1
            c = 1/(2^j)
        }
        i = i + 1
    }
    print(b)
    print(f(b))
    if (abs(f(b)) < eps1) {
        print("finding root is successful")
    }
    else print("finding root is fail")
  }



