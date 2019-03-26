library(NSM3)


### Name: pBohnWolfe
### Title: Function to compute the P-value for the observed Bohn-Wolfe U
###   statistic.
### Aliases: pBohnWolfe
### Keywords: Bohn-Wolfe Ranked-Set Sample

### ** Examples

##Hollander, Wolfe, Chicken Example 15.4 Body Mass Index:
male<-c(18.0, 20.5, 21.3, 21.3, 22.3, 23.8, 23.8, 24.6, 25.0, 25.2, 25.3, 25.9, 26.1, 27.0,
27.4, 27.4, 28.4, 29.4, 29.6, 32.8)
female<-c(17.2, 17.8, 19.9, 20.0, 21.7, 22.0, 22.3, 23.1, 23.9, 25.8, 27.1, 29.6, 30.1, 30.3,
30.7, 31.1, 35.2, 35.6, 38.1, 42.5)

pBohnWolfe(male,female,4,4,5,5)
##To use more Monte Carlo samples:
#pBohnWolfe(male,female,4,4,5,5,n.mc=100000)




