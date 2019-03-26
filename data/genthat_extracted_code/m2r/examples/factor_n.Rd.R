library(m2r)


### Name: factor_n
### Title: Factor an integer into primes
### Aliases: factor_n factor_n.

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D ##### basic usage
##D ########################################
##D 
##D 2^2 * 3^7 * 5^2 # = 218700
##D factor_n(218700)
##D factor_n.(218700)
##D 
##D (df <- factor_n(218700))
##D df$prime
##D df$power
##D str(df)
##D 
##D 
##D factor_n(218700, code = TRUE)
##D 
##D 
##D ##### other options
##D ########################################
##D 
##D (integer_pointer <- m2.("218700"))
##D m2_name(integer_pointer)
##D factor_n(integer_pointer, code = TRUE)
##D factor_n(integer_pointer)
##D 
##D 
##D 
##D factor_n(3234432540)
##D factor_n(323443254223453)
##D factor_n(rpois(1, 1e4))
##D 
##D 
##D ##### known issues
##D ########################################
##D 
##D # R doesn't handle big ints well. note in the following
##D # the m2 code number is different than the supplied number
##D factor_n(32344325422364353453, code = TRUE)
##D 
##D # this can be circumvented by passing a string instead
##D factor_n("32344325422364353453", code = TRUE)
##D 
##D # but if the factors are large, R can't handle the parsing well
##D factor_n("32344325422364353453")
##D 
##D # here's a workaround:
##D factor_pointer <- factor_n.("32344325422364353453")
##D m2_meta(factor_pointer, "ext_str")
##D extract_factors <- function(pointer) {
##D   require(stringr)
##D   str <- m2_meta(pointer, "ext_str")
##D   str <- str_sub(str, 19, -2)
##D   str <- str_extract_all(str, "\\{[0-9]+,[0-9]+\\}")[[1]]
##D   str <- str_sub(str, 2, -2)
##D   str <- str_split(str, ",")
##D   df <- as.data.frame(t(simplify2array(str)))
##D   names(df) <- c("prime", "power")
##D   df
##D }
##D (df <- extract_factors(factor_pointer))
##D 
##D 
##D # using gmp (currently broken)
##D # factor_n("32344325422364353453", gmp = TRUE)
##D m2("11 * 479 * 6138607975396537")
##D 11 * 479 * 6138607975396537
##D 
## End(Not run)




