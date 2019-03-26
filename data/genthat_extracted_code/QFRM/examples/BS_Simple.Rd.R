library(QFRM)


### Name: BS_Simple
### Title: Black-Scholes formula
### Aliases: BS_Simple

### ** Examples

#See Hull p.339, Ex.15.6.
(o <- BS_Simple(S0=42,K=40,r=.1,q=0,ttm=.5,vol=.2))$Px$Call #returns 4.759422
o$Px$Put # returns 0.8085994 as the price of the put

BS_Simple(100,90,0.05,0,2,0.30)
BS_Simple(50,60,0.1,.2,3,0.25)
BS_Simple(90,90,0.15,0,.5,0.20)
BS_Simple(15,15,.01,0.0,0.5,.5)



