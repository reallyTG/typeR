library(jjb)


### Name: max_n
### Title: Maxima and Minima _n_ elements
### Aliases: max_n min_n

### ** Examples


x = 1:10

# Defaults to traditional max
# This is more costly to compute than using the regular max function.
max_n(x) 

# Retrieve top two observations (highest first)
max_n(x, 2)

# Missing values have no effect on the sorting procedure
x[9] = NA
max_n(x, 3)

# Defaults to traditional min.
# This is more costly to compute than using the regular min function.
min_n(x)
min(x)

# Retrieve bottom two observations (lowest first)
min_n(x, 2)

# Missing values have no effect on the sorting procedure
x[2] = NA
min_n(x, 3)



