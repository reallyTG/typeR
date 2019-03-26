library(copBasic)


### Name: blomCOP
### Title: The Blomqvist's Beta of a Copula
### Aliases: blomCOP
### Keywords: copula (characteristics) copula (properties) medial
###   correlation coefficient Joe (2014) Examples and Exercises Nelsen
###   (2006) Examples and Exercises Gaussian copula Normal copula

### ** Examples

blomCOP(cop=PSP) # 1/3 precisely
## Not run: 
##D # Nelsen (2006, exer. 5.17, p. 185) : All if(...) are TRUE
##D B <- blomCOP(cop=N4212cop, para=2.2); a1pB <- 1 + B; a1mB <- 1 - B
##D G <- giniCOP(cop=N4212cop, para=2.2); a <- 1/4; b <- 3/16; c <- 3/8
##D R <-  rhoCOP(cop=N4212cop, para=2.2)
##D K <-  tauCOP(cop=N4212cop, para=2.2, brute=TRUE) # numerical issues without brute
##D if( a*Bp1^2 - 1 <= K & K <= 1 - a*Bm1^2 ) print("TRUE") #
##D if( b*Bp1^3 - 1 <= R & R <= 1 - b*Bm1^3 ) print("TRUE") #
##D if( c*Bp1^2 - 1 <= G & G <= 1 - c*Bm1^2 ) print("TRUE") #
## End(Not run)

## Not run: 
##D # A demonstration of a special feature of blomCOP for sample data.
##D # Joe (2014, p. 60; table 60) has 0.749 for GHcop(tau=0.5); n*var(hatB) as n-->infinity
##D theta <- GHcop(tau=0.5)$para; B <- blomCOP(cop=GHcop, para=theta); n <- 1000 
##D H <- sapply(1:1000, function(i) { # Let us test that with pretty large sample size:
##D 	                blomCOP(para=rCOP(n=n, cop=GHcop, para=theta), as.sample=TRUE) })
##D print(n*var(B-H)) # For 1,000 simulations of size n : 0.747, which matches Joe's result 
## End(Not run)

## Not run: 
##D # Joe (2014, p. 57) says that sqrt(n)(B-HatBeta) is Norm(0, 1 - B^2)
##D n <- 10000; B <- blomCOP(cop=PSP) # Beta = 1/3
##D H <- sapply(1:100, function(i) { message(i,"-", appendLF=FALSE)
##D 	               blomCOP(para=rCOP(n=n, cop=PSP), as.sample=TRUE) })
##D lmomco::parnor(lmomco::lmoms(sqrt(n)*(H-B))) # mu = 0.042; sigma = 0.973
##D # Joe (2014) : sqrt(1-B^2) == standard deviation (sigma) : (1-(1/3)^2) approx 0.973 
## End(Not run)



