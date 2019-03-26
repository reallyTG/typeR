library(unrepx)


### Name: yates
### Title: Yates's algorithm
### Aliases: yates gyates
### Keywords: design

### ** Examples

require("unrepx")

# pilot-plant example, BH^2 p. 177
yates(c(60, 72, 54, 68,  52, 83, 45, 80), labels = c("T", "C", "K"))

# recover shrinkage data
yates(shnkEff)

# A 3 x 2 x 4 example
y <- c( 214, 193, 207,   193, 178, 188, 
        225, 206, 213,   221, 214, 216, 
        227, 213, 221,   231, 215, 225, 
        228, 203, 206,   190, 178, 195 )
yeff <- gyates(y, c(3,2,4), basis = "helmert")
head(eff.test(yeff))  ## Show the largest few effects



