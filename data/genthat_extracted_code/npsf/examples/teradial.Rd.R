library(npsf)


### Name: teradial
### Title: Radial Measure of Technical Efficiency, the Debrue-Farrell
###   Measure
### Aliases: teradial
### Keywords: Data Envelopment Analysis Radial measure Nonparametric
###   efficiency analysis Linear programming summary

### ** Examples


require( npsf )

# Prepare data and matrices

data( pwt56 )
head( pwt56 )

# Create some missing values

pwt56 [49, "K"] <- NA # create missing

Y1 <- as.matrix ( pwt56[ pwt56$year == 1965, c("Y"), drop = FALSE] )
X1 <- as.matrix ( pwt56[ pwt56$year == 1965, c("K", "L"), drop = FALSE] )

X1 [51, 2] <- NA # create missing
X1 [49, 1] <- NA # create missing

data( ccr81 )
head( ccr81 )

# Create some missing values

ccr81 [64, "x4"] <- NA # create missing
ccr81 [68, "y2"] <- NA # create missing

Y2 <- as.matrix( ccr81[ , c("y1", "y2", "y3"), drop = FALSE] )
X2 <- as.matrix( ccr81[ , c("x1", "x2", "x3", "x4", "x5"), drop = FALSE] )

# Computing without reference set

# Using formula

# Country is a categorical variable, so nonradial gives error message

# t1 <- teradial ( Country ~ K + L, data = pwt56 )

# for computing the efficiencies of countries in 1965 
# with technology reference set is defined by observations in 1965
# (that same sample of countries)

t2 <- teradial ( Y ~ K + L, data = pwt56, rts = "v", 
base = "in", print.level = 2)

# Using a subset

t3 <- teradial ( Y ~ K + L, data = pwt56, subset = year == 1965,
	rts = "VRS", base = "in", print.level = 3 )

t4 <- teradial ( Y ~ K + L, data = pwt56, subset = Nu < 10,
	rts = "vrs", base = "I" )

t5 <- teradial ( Y ~ L, data = pwt56, subset = Nu < 10, rts = "v" )

# Multiple outputs

t8 <- teradial ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, data = ccr81,
	rts = "v", base = "i" )

# Using a subset

t7 <- teradial ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, data = ccr81,
	subset = x5 != 22, rts = "n", base = "o" )

# Computation using matrices

t9 <- teradial ( Y1 ~ X1, rts = "v", base = "i" )

# Define subsets on a fly

t10 <- teradial ( Y1[-1,] ~ X1[-2,1] )
t11 <- teradial ( Y1[-3,] ~ X1[-1,], rts = "v", base = "o" )

# Multiple outputs

t12 <- teradial ( Y2 ~ X2 )
t13 <- teradial ( Y2[-66,] ~ X2[-1, -c(1,3)] )


# Computing with reference set

# Using formula

# For computing the efficiencies of countries with order number
# less than 10 with technology reference set defined by countries
# with order number larger than 10 and smaller than 11 (in effect 
# no reference set, hence warning) type

t14 <- teradial ( Y ~ K + L, data = pwt56, subset = Nu < 10, 
	ref = Y ~ K + L, data.ref = pwt56,
	subset.ref = Nu > 10 & Nu < 11 ) # warning

# For computing the efficiencies of countries with order number
# less than 10 with technology reference set defined by countries 
# with order number larger than 10 and smaller than 15 type

t15 <- teradial ( Y ~ K + L, data = pwt56, subset = Nu < 10, ref = Y ~ K + L, 
	data.ref = pwt56, subset.ref = Nu > 10 & Nu < 15 )

# For computing the efficiencies of countries in 1965 
# with technology reference set is defined by observations in both
# 1965 and 1990 (all) type
	
t16 <- teradial ( Y ~ K + L, data = pwt56, subset = year == 1965,
	rts = "v", base = "i", 
	ref = Y ~ K + L, data.ref = pwt56 )

# For computing the efficiencies of countries in 1990
# with technology reference set is defined by observations in 1965
# type

t17 <- teradial ( Y ~ K + L, data = pwt56, subset = year == 1990, 
	ref = Y ~ K + L, data.ref = pwt56, subset.ref = year == 1965 )

# Using matrices

t18 <- teradial ( Y1[-1,] ~ X1[-2,], ref = Y1[-2,] ~ X1[-1,] )

# error: not equal number of observations in outputs and inputs

# t19 <- teradial ( Y1[-1,] ~ X1[-(1:2),], 
# ref = Y1[-2,] ~ X1[-1,1] )

# Combined formula and matrix

# error: not equal number of inputs in data and reference set

# t20 <- teradial ( Y ~ K + L, data = pwt56, subset = Nu < 10,
# ref = Y1[-2,] ~ X1[-1,1] )

t21 <- teradial ( Y ~ K + L, data = pwt56, subset = Nu < 10, 
	ref = Y1[-2,] ~ X1[-1,] )
	
## Not run: 
##D 
##D # Really large data-set
##D 
##D data(usmanuf)
##D head(usmanuf)
##D 
##D nrow(usmanuf)
##D table(usmanuf$year)
##D 
##D # This will take some time depending on computer power
##D 
##D t22 <- teradial ( Y ~ K + L + M, data = usmanuf, 
##D 	subset = year >= 1995 & year <= 2000 ) 
##D 
##D # Summary
##D 
##D summary ( t22$te )
##D 
##D # Write efficiencies to the data frame:
##D 
##D usmanuf$te_nonrad_crs_out[ t22$esample ] <- t22$te
##D 
##D head(usmanuf, 17)
##D 
## End(Not run)




