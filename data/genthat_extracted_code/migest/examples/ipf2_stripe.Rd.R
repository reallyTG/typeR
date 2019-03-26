library(migest)


### Name: ipf2_stripe
### Title: Iterative Proportional Fitting Routine for the Indirect
###   Estimation of Origin-Destination-Type Migration Flow Tables with
###   Known Origin and Destination Margins and Stripe Elements.
### Aliases: ipf2_stripe

### ** Examples

y <- ipf2_stripe(rtot = c(85, 70, 35, 30, 60, 55, 65),
 stot = matrix(c(15,20,50,
                35,10,25,
                5 ,0 ,30,
                10,10,10,
                30,30,0,
                15,30,10,
                35,25,5 ), ncol = 3, byrow = TRUE),
 stripe = stripe_matrix(x = 1:21, s = c(2,2,3), byrow = TRUE))
 addmargins(y$mu)



