library(ibdreg)


### Name: sim.mark.prop
### Title: Simulate Marker Propagation
### Aliases: sim.mark.prop

### ** Examples

###################################################
### The following examples use a list as input: ###
###################################################

ped7 <- list(NULL)
ped7$person <- c(1,2,3,4,5,6,7)
ped7$father <- c(0,0,0,1,0,3,5)
ped7$mother <- c(0,0,0,2,0,4,4)
ped7$sex    <- c(1,2,1,2,1,1,1)
ped7$chrom1 <- c(1,3,5,0,7,0,0)
ped7$chrom2 <- c(2,4,6,0,8,0,0)
 
#ped7:

#       1-------2       
#     1/2   |   3/4     
#           |           
#           |           
#   3-------4-------5   
# 5/6   |  0/0  |   7/8 
#       |       |       
#       |       |       
#       6       7       
#     0/0       0/0     

prop7 <- sim.mark.prop(ped7, n.iter=5)

prop7


## an x.linked example

ped7.x <- list(NULL)
ped7.x$person <- c(1,2,3,4,5,6,7)
ped7.x$father <- c(0,0,0,1,0,3,5)
ped7.x$mother <- c(0,0,0,2,0,4,4)
ped7.x$sex    <- c(1,2,1,2,1,1,1)
ped7.x$chrom1 <- c(1,2,4,0,5,0,0)
ped7.x$chrom2 <- c(1,3,4,0,5,0,0)

# ped7.x:
#
#       1-------2       
#     1/1   |   2/3     
#           |           
#           |           
#   3-------4-------5   
# 4/4   |  0/0  |   5/5 
#       |       |       
#       |       |       
#       6       7       
#     0/0       0/0 

prop7X <- sim.mark.prop(ped7.x, x.linked=TRUE, n.iter=5)

prop7X



