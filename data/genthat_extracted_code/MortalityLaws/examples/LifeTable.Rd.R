library(MortalityLaws)


### Name: LifeTable
### Title: Compute Life Tables from Mortality Data
### Aliases: LifeTable

### ** Examples

# Example 1 --- Full life tables with different inputs ---
 
y  <- 1900
x  <- as.numeric(rownames(ahmd$mx))
Dx <- ahmd$Dx[, paste(y)]
Ex <- ahmd$Ex[, paste(y)]

LT1 <- LifeTable(x, Dx = Dx, Ex = Ex)
LT2 <- LifeTable(x, mx = LT1$lt$mx)
LT3 <- LifeTable(x, qx = LT1$lt$qx)
LT4 <- LifeTable(x, lx = LT1$lt$lx)
LT5 <- LifeTable(x, dx = LT1$lt$dx)

LT1
LT5
ls(LT5) 

# Example 2 --- Compute multiple life tables at once ---

LTs = LifeTable(x, mx = ahmd$mx)
LTs
# A warning is printed if the input contains missing values. 
# Some of the missing values can be handled by the function.

# Example 3 --- Abridged life table ------------

x  = c(0, 1, seq(5, 110, by = 5))
mx = c(.053, .005, .001, .0012, .0018, .002, .003, .004, 
       .004, .005, .006, .0093, .0129, .019, .031, .049, 
       .084, .129, .180, .2354, .3085, .390, .478, .551)
lt = LifeTable(x, mx = mx, sex = "female")
lt




