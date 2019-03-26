library(multilaterals)


### Name: eks
### Title: eks: transforming a non-transitive index number matrix into a
###   transitive one
### Aliases: eks

### ** Examples


# Trasforming a non-transitive Fisher matrix into a transitive one
data(multil_data)

I_nt[1,3]*I_nt[3,4]
I_nt[1,4] #non-transitive

I_t = eks(I_nt)
I_t[1,3]*I_t[3,4]
I_t[1,4] #transitive





