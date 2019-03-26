library(numbers)


### Name: dropletPi
### Title: Droplet Algorithm for pi and e
### Aliases: dropletPi dropletE

### ** Examples

##  Example
dropletE(20)                    # [1] "2.71828182845904523536"
print(exp(1), digits=20)        # [1]  2.7182818284590450908

dropletPi(20)                   # [1] "3.14159265358979323846"
print(pi, digits=20)            # [1]  3.141592653589793116

## Not run: 
##D E <- dropletE(1000)
##D table(strsplit(substring(E, 3, 1002), ""))
##D #    0   1   2   3   4   5   6   7   8   9 
##D #  100  96  97 109 100  85  99  99 103 112
##D 
##D Pi <- dropletPi(1000)
##D table(strsplit(substring(Pi, 3, 1002), ""))
##D #   0   1   2   3   4   5   6   7   8   9 
##D #  93 116 103 102  93  97  94  95 101 106 
## End(Not run)



