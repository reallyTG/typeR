library(jjb)


### Name: floor_and_cap
### Title: Floor and Cap a Numeric Variable
### Aliases: floor_and_cap

### ** Examples


# One case version
n = 100

x = rnorm(n)

x[n - 1] = -99999
x[n] = 10000

y = floor_and_cap(x)

# Dataset example

d = data.frame(x, y = rnorm(n))

o = sapply(d, floor_and_cap)



