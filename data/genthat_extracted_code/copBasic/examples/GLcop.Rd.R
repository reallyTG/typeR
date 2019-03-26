library(copBasic)


### Name: GLcop
### Title: The Galambos Extreme Value Copula (with Gamma Power Mixture
###   [Joe/BB4] and Lower Extreme Value Limit)
### Aliases: GLcop GLEVcop GLPMcop JOcopBB4
### Keywords: Galambos copula Galambos copula (lower extreme value form)
###   copula (formulas) copula Joe (2014) Examples and Exercises copula
###   (extreme value) extreme value copula Joe/BB4 copula

### ** Examples

# Theta = pi for GLcop and recovery through Blomqvist Beta     (Joe, 2014, p. 175)
log(2)/(log(log(2)/log(1+blomCOP(cop=GLcop, para=pi))))

# Theta = 2 and delta = 3 for the GLPM form and Blomqvist Beta (Joe, 2014, p. 197)
t <- 2; Btheo <- blomCOP(GLPMcop, para=c(t,3))
Bform <- (2^(t+1) - 1 - taildepCOP(GLPMcop, para=c(t,3))$lambdaU*(2^t -1))^(-1/t)
print(c(Btheo, 4*Bform-1)) # [1] 0.8611903 0.8611900

## Not run: 
##D # See the Note, but check Blomqvist Beta:
##D blomCOP(cop=GLcop, para=c(6.043619))  # 0.8552863 (2p version)
##D blomCOP(cop=GLcop, para=c(5.6,0.3))   # 0.8552863 (1p version)
## End(Not run)



