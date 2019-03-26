library(selectiongain)


### Name: multistagegain
### Title: Function for calculating the expected multi-stage selection gain
### Aliases: multistagegain
### Keywords: Truncated multivariate normal

### ** Examples

Q=c(0.4308,0.9804,1.8603)
corr=matrix( c(1,      0.3508,0.3508,0.4979,
               0.3508, 1,     0.3016,0.5630,
               0.3508, 0.3016,1,     0.5630,
               0.4979, 0.5630,0.5630,1),
              nrow=4
)



multistagegain(corr=corr,Q=Q)

# value  1.227475





