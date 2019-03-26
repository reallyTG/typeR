library(MM)


### Name: sweets
### Title: Synthetic dataset due to Hankin
### Aliases: sweets sweets_tally sweets_table sweets_array
### Keywords: datasets

### ** Examples

data(sweets)

# show correspondence between sweets_table and sweets_tally:
cbind(sweets_table, sweets_tally)

# Sum the data, by sweet and child and test:
fisher.test(apply(sweets,1:2,sum))
# Not significant!




# Now test for overdispersion.
# First set up the regressors:

jj1 <- apply(sweets_array,3,tcrossprod)
jj2 <- apply(sweets_array,3, crossprod)
dim(jj1) <- c(2,2,37)
dim(jj2) <- c(3,3,37)

theta_xy <- jj1[1,2,]
  phi_ab <- jj2[1,2,]
  phi_ac <- jj2[1,3,]
  phi_bc <- jj2[2,3,]

# Now the offset:
Off <- apply(sweets_array,3,function(x){-sum(lfactorial(x))})

# Now the formula:
f <- formula(sweets_tally~ -1 + theta_xy + phi_ab + phi_ac + phi_bc)

# Now the Lindsey Poisson device:
out <- glm(formula=f, offset=Off, family=poisson)

summary(out)
#  See how the residual deviance is comparable with the degrees of freedom  




