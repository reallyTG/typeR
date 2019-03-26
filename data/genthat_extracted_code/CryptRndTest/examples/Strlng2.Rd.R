library(CryptRndTest)


### Name: Strlng2
### Title: Stirling Number of The Second Kind
### Aliases: Strlng2
### Keywords: approximation large factorials

### ** Examples

# When n = 10 and k = 4, exact value is 34105
gmp::Stirling2(10,4)           
Strlng2(10,4,log=FALSE)
# ---- Moderate values of n and k ----
# When n = 30 and k = 20, exact value is 581535955088511150
log(581535955088511150)-log(gmp::Stirling2(30,20))
log(581535955088511150)-Strlng2(30,20,log=TRUE)  
# ---- Large values of n and k ----
gmp::Stirling2(50,10)
Strlng2(50,10,log=FALSE) 



