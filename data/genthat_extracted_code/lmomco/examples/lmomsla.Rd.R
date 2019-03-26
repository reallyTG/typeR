library(lmomco)


### Name: lmomsla
### Title: Trimmed L-moments of the Slash Distribution
### Aliases: lmomsla
### Keywords: L-moment (distribution) Distribution: Slash

### ** Examples

## Not run: 
##D # This example was used to numerically back into the TL-moments and the 
##D # relation between \alpha and \lambda_2.
##D "lmomtrim1" <- function(para) {
##D     bigF <- 0.999
##D     minX <- para$para[1] - para$para[2]*qnorm(1 - bigF) / qunif(1 - bigF)
##D     maxX <- para$para[1] + para$para[2]*qnorm(    bigF) / qunif(1 - bigF)
##D     minF <- cdfsla(minX, para); maxF <- cdfsla(maxX, para)
##D     lmr <- theoTLmoms(para, nmom = 6, leftrim = 1, rightrim = 1)
##D }
##D 
##D U <- -10; i <- 0
##D As <- seq(.1,abs(10),by=.2)
##D L1s <- L2s <- T3s <- T4s <- T5s <- T6s <- vector(mode="numeric", length=length(As))
##D for(A in As) {
##D    i <- i + 1
##D    lmr <- lmomtrim1(vec2par(c(U, A), type="sla"))
##D    L1s[i] <- lmr$lambdas[1]; L2s[i] <- lmr$lambdas[2]
##D    T3s[i] <- lmr$ratios[3];  T4s[i] <- lmr$ratios[4]
##D    T5s[i] <- lmr$ratios[5];  T6s[i] <- lmr$ratios[6]
##D }
##D print(summary(lm(L2s~As-1))$coe)
##D print(mean(T4s))
##D print(mean(T6s))
## End(Not run)



