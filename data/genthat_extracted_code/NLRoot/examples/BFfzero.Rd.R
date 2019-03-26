library(NLRoot)


### Name: BFfzero
### Title: Bisection Method
### Aliases: BFfzero
### Keywords: ~kwd1 ~kwd2

### ** Examples
f<-function(x){x^3-x-1};f1<-function(x){3*x^2-1};

    BFfzero(f,0,2)
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (f, a, b, num = 10, eps = 1e-05) 
{
    h = abs(b - a)/num
    i = 0
    j = 0
    a1 = b1 = 0
    while (i <= num) {
        a1 = a + i * h
        b1 = a1 + h
        if (f(a1) == 0) {
            print(a1)
            print(f(a1))
        }
        else if (f(b1) == 0) {
            print(b1)
            print(f(b1))
        }
        else if (f(a1) * f(b1) < 0) {
            repeat {
                if (abs(b1 - a1) < eps) 
                  break
                x <- (a1 + b1)/2
                if (f(a1) * f(x) < 0) 
                  b1 <- x
                else a1 <- x
            }
            print(j + 1)
            j = j + 1
            print((a1 + b1)/2)
            print(f((a1 + b1)/2))
        }
        i = i + 1
    }
    if (j == 0) 
        print("finding root is fail")
    else print("finding root is successful")
  }



