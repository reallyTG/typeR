library(numbers)


### Name: legendre_sym
### Title: Legendre and Jacobi Symbol
### Aliases: legendre_sym jacobi_sym

### ** Examples

Lsym <- Vectorize(legendre_sym, 'a')

# all quadratic residues of p = 17
qr17 <- which(Lsym(1:16, 17) == 1)      #  1  2  4  8  9 13 15 16
sort(unique((1:16)^2 %% 17))            #  the same

## Not run: 
##D # how about large numbers?
##D p <- 1198112137                         #  isPrime(p) TRUE
##D x <- 4652356
##D a <- mod(x^2, p)                        #  520595831
##D legendre_sym(a, p)                      #  1
##D legendre_sym(a+1, p)                    # -1
##D   
## End(Not run)

jacobi_sym(11, 12)                      # -1



