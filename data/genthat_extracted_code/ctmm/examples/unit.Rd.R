library(ctmm)


### Name: Unit conversion
### Title: Convert dimensionful quantities to and from SI units
### Aliases: %#%

### ** Examples

# one yard -> meters
1 %#% "yard"

# one meter -> yards
"yard" %#% 1

# 1 month -> days
"day" %#% 1 %#% "month"

# 6 miles per hour -> meters per second
"hour" %#% 6 %#% "mile"



