library(FME)


### Name: cross2long
### Title: Convert a dataset in wide (crosstab) format to long (database)
###   format
### Aliases: cross2long
### Keywords: utilities

### ** Examples


## =======================================================================
## Suppose we have measured sediment oxygen concentration profiles
## =======================================================================

depth  <- 0:7
O2mud  <- c( 6,   1,   0.5, 0.1, 0.05,0,   0,   0)
O2silt <- c( 6,   5,   3,   2,   1.5, 1,   0.5, 0)
O2sand <- c( 6,   6,   5,   4,   3,   2,   1,   0)
zones  <- c("a", "b", "b", "c", "c", "d", "d", "e")
oxygen <- data.frame(depth = depth,
                     zone  = zones,
                     mud   = O2mud,
                     silt  = O2silt,
                     sand  = O2sand
          )

 cross2long(data = oxygen, x = depth, 
            select = c(silt, mud), replicate = zone)

 cross2long(data = oxygen, x = depth, 
            select = c(mud, -silt), replicate = zone)

# twice the same column name: replicates
 colnames(oxygen)[4] <- "mud"    

 cross2long(data=oxygen, x = depth, select = mud)



