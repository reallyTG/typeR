library(noise)


### Name: elowitz_data
### Title: Expression of reporter genes in the D22 and M22 E. coli cells
###   from Elowitz et al (2002).
### Aliases: elowitz_data
### Keywords: datasets

### ** Examples

data(elowitz_data)

# Normalize data such that they are 
# comparable to Fig 3a in Elowitz et al. (2002).
# Normalized data have mean 1.
D22.cfp.norm <- (elowitz_data$D22[,1]-mean (elowitz_data$D22[,1]))/sd(elowitz_data$D22[,1])/8+1
D22.yfp.norm <- (elowitz_data$D22[,2]-mean (elowitz_data$D22[,2]))/sd(elowitz_data$D22[,2])/8+1

M22.cfp.norm <- (elowitz_data$M22[,1]-mean (elowitz_data$M22[,1]))/sd(elowitz_data$M22[,1])/12+1
M22.yfp.norm <- (elowitz_data$M22[,2]-mean (elowitz_data$M22[,2]))/sd(elowitz_data$M22[,2])/12+1

# Compute noise estimates.
# Since the mean is 1, estimates with and without 
# the scaling are the same.
unlist (computeIntrinsicNoise (D22.cfp.norm, D22.yfp.norm))
unlist (computeExtrinsicNoise (D22.cfp.norm, D22.yfp.norm))

unlist (computeIntrinsicNoise (M22.cfp.norm, M22.yfp.norm))
unlist (computeExtrinsicNoise (M22.cfp.norm, M22.yfp.norm))




