library(TSdist)


### Name: FourierDistance
### Title: Fourier Coefficient based distance.
### Aliases: FourierDistance

### ** Examples


# The objects example.series1 and example.series2 are two 
# numeric series of length 100 contained in the TSdist package. 

data(example.series1)
data(example.series2)

# For information on their generation and shape see help 
# page of example.series.

help(example.series)

# Calculate the Fourier coefficient based  distance using 
# the default number of coefficients:

FourierDistance(example.series1, example.series2)

# Calculate the Fourier coefficient based  distance using 
# only the first 20 Fourier coefficients:

FourierDistance(example.series1, example.series2, n=20)




