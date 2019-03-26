library(numbers)


### Name: modpower
### Title: Power Function modulo m
### Aliases: modpower modorder

### ** Examples

modpower(2, 100, 7)  #=> 2
modpower(3, 100, 7)  #=> 4
modorder(7, 17)      #=> 16, i.e. 7 is a primitive root mod 17

##  Gauss' table of primitive roots modulo prime numbers < 100
proots <- c(2,  2,  3,  2,  2,  6,  5, 10, 10, 10, 2,  2, 10, 17,  5,  5,
            6, 28, 10, 10, 26, 10, 10,  5, 12, 62, 5, 29, 11, 50, 30, 10)
P <- Primes(100)
for (i in seq(along=P)) {
    cat(P[i], "\t", modorder(proots[i], P[i]), proots[i], "\t", "\n")
}

## Not run: 
##D ##  Lehmann's primality test
##D lehmann_test <- function(n, ntry = 25) {
##D     if (!is.numeric(n) || ceiling(n) != floor(n) || n < 0)
##D         stop("Argument 'n' must be a natural number")
##D     if (n >= 9e7)
##D         stop("Argument 'n' should be smaller than 9e7.")
##D 
##D     if (n < 2)                      return(FALSE)
##D     else if (n == 2)                return(TRUE)
##D     else if (n > 2 && n %% 2 == 0)  return(FALSE)
##D 
##D     k <- floor(ntry)
##D     if (k < 1) k <- 1
##D     if (k > n-2) a <- 2:(n-1)
##D     else         a <- sample(2:(n-1), k, replace = FALSE) 
##D 
##D     for (i in 1:length(a)) {
##D         m <- modpower(a[i], (n-1)/2, n)
##D         if (m != 1 && m != n-1) return(FALSE)
##D     }
##D     return(TRUE)
##D }
##D 
##D ##  Examples
##D for (i in seq(1001, 1011, by = 2))
##D     if (lehmann_test(i)) cat(i, "\n")
##D # 1009
##D system.time(lehmann_test(27644437, 50))    # TRUE
##D #    user  system elapsed 
##D #   0.086   0.151   0.235
## End(Not run)



