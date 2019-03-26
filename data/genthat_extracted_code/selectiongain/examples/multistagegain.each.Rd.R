library(selectiongain)


### Name: multistagegain.each
### Title: Function for calculating the selection gain in each stage
### Aliases: multistagegain.each
### Keywords: Truncated multivariate normal

### ** Examples


# example 1

corr=matrix( c(1,      0.3508,0.3508,0.4979,
               0.3508, 1,     0.3016,0.5630,
               0.3508, 0.3016,1,     0.5630,
               0.4979, 0.5630,0.5630,1), 
              nrow=4  
)

multistagegain.each(Q=c(0.4308,0.9804,1.8603),corr=corr)

# examples 2

 alpha1<- 1/24
 alpha2<- 1
 Q=multistagetp(alpha=c(alpha1,alpha2),corr=corr[2:3,2:3])


corr=matrix( c(1,        0.7071068,0.9354143,
               0.7071068,1,        0.7559289,
               0.9354143,0.7559289,1), 
              nrow=3  
)

multistagegain.each(Q=Q,corr=corr)



