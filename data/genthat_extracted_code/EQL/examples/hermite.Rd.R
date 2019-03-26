library(EQL)


### Name: hermite
### Title: Hermite Polynomials
### Aliases: hermite

### ** Examples

2^(3/2)*hermite(sqrt(2)*5, 3)    # = 940
hermite(5, 3, FALSE)             # = 940
hermite(2:4, 1:3)                # H_1(2), H_2(3), H_3(4)
hermite(2:4, 2)                  # H_2(2), H_2(3), H_2(4)
hermite(2, 1:3)                  # H_1(2), H_2(2), H_3(2)
## Not run: 
##D hermite(1:3, 1:4)                # Error!
## End(Not run)



