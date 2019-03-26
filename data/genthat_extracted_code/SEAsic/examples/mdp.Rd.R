library(SEAsic)


### Name: mdp
### Title: Mean Difference for Pairs
### Aliases: mdp

### ** Examples

#Unstandardized MD for subpopulations 1 and 2 in the example data set, ex.data
mdp(x=ex.data[,1],g1=ex.data[,3],g2=ex.data[,4],f= ex.data[,8])

#Unstandardized MD for subpopulations 4 and 5 in the example data set, ex.data
mdp(x=ex.data[,1],g1=ex.data[,6],g2=ex.data[,7],f= ex.data[,8])

#Standardized MD for subpopulations 4 and 5 in the example data set, ex.data
mdp(x=ex.data[,1],g1=ex.data[,6],g2=ex.data[,7],f= ex.data[,8],s=4.2)



