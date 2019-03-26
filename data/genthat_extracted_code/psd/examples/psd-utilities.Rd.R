library(psd)


### Name: psd-utilities
### Title: Various utility functions.
### Aliases: colvec create_poly dB db decibels is.amt is.spec is.tapers mod
###   na_mat ones psd-utilities rowvec varddiff varddiff.default
###   varddiff.spec vardiff vector_reshape zeros

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Various utilities
##D ##
##D 
##D set.seed(1234)
##D X <- rnorm(1e2)
##D 
##D #
##D # Matrix and vector creation:
##D #
##D # NA matrix
##D nd <- 5
##D na_mat(nd)
##D na_mat(nd,nd-1)
##D 
##D # zeros
##D zeros(nd)
##D 
##D # and ones
##D ones(nd)
##D 
##D #
##D # Check for tapers object:
##D #
##D is.tapers(X)
##D is.tapers(as.tapers(X))
##D 
##D #
##D # Check for spec object:
##D #
##D PSD <- spectrum(X, plot=FALSE)
##D plot(PSD)
##D # return is class 'spec'
##D is.spec(PSD) # TRUE
##D # but the underlying structure is just a list
##D PSD <- unclass(PSD)
##D is.spec(PSD) # FALSE
##D 
##D #
##D # decibels
##D #
##D dB(1) # signal is equal <--> zero dB
##D sig <- 1e-10
##D all.equal(sig, dB(dB(sig), invert=TRUE))
##D pow <- sig**2
##D all.equal(pow, dB(dB(sig, is.power=TRUE), invert=TRUE, is.power=TRUE))
##D 
##D # 
##D # Variance of difference series
##D #
##D vardiff(X) # first difference
##D varddiff(X) # second difference
##D all.equal(vardiff(X, TRUE), varddiff(X))
##D 
##D #
##D # modulo division
##D #
##D x <- 1:10
##D mc1a <- mod(1,2)
##D mc2a <- mod(1+x,2)
##D mc1b <- 1 %% 2
##D mc2b <- 1 + x %% 2
##D mc2c <- (1 + x) %% 2
##D all.equal(mc1a, mc1b) # TRUE
##D all.equal(mc2a, mc2b) # "Mean absolute difference: 2"
##D all.equal(mc2a, mc2c) # TRUE
##D # on a series
##D modulo_floor(1:10) # defaults to 2
##D modulo_floor(1:10, 3)
##D 
## End(Not run)#REX



