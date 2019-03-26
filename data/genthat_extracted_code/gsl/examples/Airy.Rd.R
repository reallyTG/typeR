library(gsl)


### Name: Airy
### Title: Airy functions
### Aliases: Airy airy airy_Ai airy_Bi airy_Bi_e airy_Ai_scaled
###   airy_Ai_scaled_e airy_Bi_scaled airy_Bi_scaled_e airy_Ai_deriv
###   airy_Ai_deriv_e airy_Bi_deriv airy_Bi_deriv_e airy_Ai_deriv_scaled
###   airy_Ai_deriv_scaled_e airy_Bi_deriv_scaled airy_Bi_deriv_scaled_e
###   airy_zero_Ai airy_zero_Ai_e airy_zero_Bi airy_zero_Bi_e
###   airy_zero_Ai_deriv airy_zero_Ai_deriv_e airy_zero_Bi_deriv
###   airy_zero_Bi_deriv_e

### ** Examples


x <- seq(from=0,to=1,by=0.01)

f <- function(x){
cbind(x=x, Ai= airy_Ai(x), Aidash= airy_Ai_deriv(x),
Bi=airy_Ai(x),Bidash=airy_Bi_deriv(x))
}

f(x)  #table 10.11, p475
f(-x) #table 10.11, p476


x <- 1:10  #table 10.13, p478
cbind(x,
 airy_zero_Ai(x), airy_Ai_deriv(airy_zero_Ai(x)),
 airy_zero_Ai_deriv(x), airy_Ai(airy_zero_Ai_deriv(x)),
 airy_zero_Bi(x), airy_Bi_deriv(airy_zero_Bi(x)),

 airy_zero_Bi_deriv(x), airy_Bi(airy_zero_Bi_deriv(x))
 )


# Verify 10.4.4 and 10.4.5, p446:
3^(-2/3)/gamma(2/3)   - airy_Ai(0)
3^(-1/3) / gamma(1/3) + airy_Ai_deriv(0) 
3^(-1/6) / gamma(2/3) - airy_Bi(0)
3^(1/6) / gamma(1/3)  - airy_Bi_deriv(0)
#  All should be small





