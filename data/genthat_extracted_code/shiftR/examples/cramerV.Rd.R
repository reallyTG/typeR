library(shiftR)


### Name: cramerV
### Title: Calculate Cramer's V (phi) Coefficient
### Aliases: cramerV

### ** Examples

# Zero score for perfect independence
cramerV(100,10000,10000,1000000)

# Positive score for increased overlap
cramerV(150,10000,10000,1000000)

# Negative score for decreased overlap
cramerV( 50,10000,10000,1000000)

# We can input a vector for sum12
cramerV(99:101,10000,10000,1000000)



