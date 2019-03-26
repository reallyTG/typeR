library(roahd)


### Name: sub-.mfData
### Title: Operator 'sub-.mfData' to subset 'mfData' obejcts
### Aliases: sub-.mfData [.mfData

### ** Examples

# Defining parameters
N = 1e2

P = 1e3

t0 = 0
t1 = 1

# Defining the measurement grid
grid = seq( t0, t1, length.out = P )

# Generating an exponential covariance matrix to be used in the simulation of
# the functional datasets (see the related help for details)
C = exp_cov_function( grid, alpha = 0.3, beta = 0.4 )

# Simulating the measurements of two univariate functional datasets with
# required center and covariance function
Data_1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = C )
Data_2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * grid ), Cov = C )

# Building the mfData object
mfD = mfData( grid, list( Data_1, Data_2 ) )

# Subsetting the first 10 elements and 10 time points
mfD[1:10, 1:10]

# Subsetting only observations
mfD[1:10,]

# Subsetting only time points (contiguously)
mfD[,1:10]




