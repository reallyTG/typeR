library(randtoolbox)


### Name: pseudoRNG
### Title: Toolbox for pseudo and quasi random number generation
### Aliases: pseudoRNG congruRand SFMT WELL knuthTAOCP setSeed
###   pseudo.randtoolbox
### Keywords: distribution

### ** Examples

require(rngWELL)

# (1) the Park Miller sequence
#

# Park Miller sequence, i.e. mod = 2^31-1, mult = 16807, incr=0
# the first 10 seeds used in Park Miller sequence
# 16807          1
# 282475249          2
# 1622650073          3
# 984943658          4
# 1144108930          5
# 470211272          6
# 101027544          7
# 1457850878          8
# 1458777923          9
# 2007237709         10
setSeed(1)
congruRand(10, echo=TRUE)

# the 9998+ th terms 
# 925166085       9998
# 1484786315       9999
# 1043618065      10000
# 1589873406      10001
# 2010798668      10002
setSeed(1614852353) #seed for the 9997th term
congruRand(5, echo=TRUE)

# (2) the SF Mersenne Twister algorithm
SFMT(1000)

#Kolmogorov Smirnov test
#KS statistic should be around 0.037
ks.test(SFMT(1000), punif) 
	
#KS statistic should be around 0.0076
ks.test(SFMT(10000), punif) 

#different mersenne exponent with a fixed parameter set
#
SFMT(10, mexp = 607, usepset = FALSE)
SFMT(10, mexp = 1279, usepset = FALSE)
SFMT(10, mexp = 2281, usepset = FALSE)
SFMT(10, mexp = 4253, usepset = FALSE)
SFMT(10, mexp = 11213, usepset = FALSE)
SFMT(10, mexp = 19937, usepset = FALSE)
SFMT(10, mexp = 44497, usepset = FALSE)
SFMT(10, mexp = 86243, usepset = FALSE)
SFMT(10, mexp = 132049, usepset = FALSE)
SFMT(10, mexp = 216091, usepset = FALSE)

#use different sets of parameters [default when possible]
#
for(i in 1:7) print(SFMT(1, mexp = 607))
for(i in 1:7) print(SFMT(1, mexp = 2281))
for(i in 1:7) print(SFMT(1, mexp = 4253))
for(i in 1:7) print(SFMT(1, mexp = 11213))
for(i in 1:7) print(SFMT(1, mexp = 19937))

#use a fixed set and a fixed seed
#should be the same output
setSeed(08082008)
SFMT(1, usepset = FALSE)
setSeed(08082008)
SFMT(1, usepset = FALSE)


# (3) withtorus argument
# 

# one third of outputs comes from Torus algorithm
u <- SFMT(1000, with=1/3)
# the third term of the following code is the first term of torus sequence
print(u[666:670] )

# (4) WELL generator
#

# 'basic' calls
# WELL512
WELL(10, order = 512)
# WELL1024
WELL(10, order = 1024)
# WELL19937
WELL(10, order = 19937)
# WELL44497
WELL(10, order = 44497)
# WELL19937 with tempering 
WELL(10, order = 19937, temper = TRUE)
# WELL44497 with tempering
WELL(10, order = 44497, temper = TRUE)

# tempering vs no tempering
setSeed4WELL(08082008)
WELL(10, order =19937)
setSeed4WELL(08082008)
WELL(10, order =19937, temper=TRUE)

# (5) Knuth TAOCP generator
#
knuthTAOCP(10)
knuthTAOCP(10, 2) 


# (6) How to set the seed?
# all example is duplicated to ensure setSeed works

# congruRand
setSeed(1302)
congruRand(1)
setSeed(1302)
congruRand(1)
# SFMT
setSeed(1302)
SFMT(1, usepset=FALSE)
setSeed(1302)
SFMT(1, usepset=FALSE)
# BEWARE if you do not set usepset to FALSE
setSeed(1302)
SFMT(1)
setSeed(1302)
SFMT(1)
# WELL
setSeed(1302)
WELL(1)
setSeed(1302)
WELL(1)
# Knuth TAOCP
setSeed(1302)
knuthTAOCP(1)
setSeed(1302)
knuthTAOCP(1)



# (7) computation times on my macbook, mean of 1000 runs
#

## Not run: 
##D # algorithm			time in seconds for n=10^6
##D # classical Mersenne Twister  			0.066 
##D # SF Mersenne Twister  	       			0.044 
##D # WELL generator				0.065
##D # Knuth TAOCP					0.046
##D # Park Miller  		      			0.108
##D n <- 1e+06
##D mean( replicate( 1000, system.time( runif(n), gcFirst=TRUE)[3]) )
##D mean( replicate( 1000, system.time( SFMT(n), gcFirst=TRUE)[3]) )
##D mean( replicate( 1000, system.time( WELL(n), gcFirst=TRUE)[3]) )
##D mean( replicate( 1000, system.time( knuthTAOCP(n), gcFirst=TRUE)[3]) )
##D mean( replicate( 1000, system.time( congruRand(n), gcFirst=TRUE)[3]) )
##D 	
## End(Not run)




