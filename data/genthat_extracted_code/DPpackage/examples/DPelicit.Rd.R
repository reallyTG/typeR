library(DPpackage)


### Name: DPelicit
### Title: Performs a prior elicitation for the precision parameter of a DP
###   prior
### Aliases: DPelicit DPelicit.default
### Keywords: models nonparametric

### ** Examples


    # Calculate the expected value and the standard deviation
    # for the number of cluster given alpha ~ Gamma(a0,b0).

      DPelicit(200,a0=2.01,b0=2.01,method="JGL")
      DPelicit(200,a0=2.01,b0=2.01,method="KMQ")

    # Calculate the values of a0 and b0, given the expected value 
    # and the standard deviation of the number of clusters

      DPelicit(200,mean=3.1,std=2.7,method="JGL")
      DPelicit(200,mean=3.1,std=2.7,method="KMQ")



