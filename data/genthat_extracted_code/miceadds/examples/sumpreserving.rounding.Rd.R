library(miceadds)


### Name: sumpreserving.rounding
### Title: Sum Preserving Rounding
### Aliases: sumpreserving.rounding
### Keywords: Rounding

### ** Examples

#############################################################################
# EXAMPLE 1:
#############################################################################

# define example data
data <- c( 1455, 1261, 1067, 970, 582, 97 )
data <- 100 * data / sum(data)

( x1 <- round( data ) )
sum(x1)
(x2 <- miceadds::sumpreserving.rounding( data ) )
sum(x2)

  ##   > ( x1 <- round( data ) )
  ##   [1] 27 23 20 18 11  2
  ##   > sum(x1)
  ##   [1] 101
  ##   > (x2 <- miceadds::sumpreserving.rounding( data ) )
  ##   [1] 27 23 20 18 10  2
  ##   > sum(x2)
  ##   [1] 100

#############################################################################
# EXAMPLE 2:
#############################################################################

# matrix input
data <- rbind( data, data )
( x1 <- round( data ) )
rowSums(x1)
(x2 <- miceadds::sumpreserving.rounding( data ) )
rowSums(x2)

#############################################################################
# EXAMPLE 3:
#############################################################################

x2 <- c( 1.4, 1.4, 1.2 )
round(x2)
sumpreserving.rounding(x2)
  ##   > round(x2)
  ##   [1] 1 1 1
  ##   > miceadds::sumpreserving.rounding(x2)
  ##   [1] 1 2 1



