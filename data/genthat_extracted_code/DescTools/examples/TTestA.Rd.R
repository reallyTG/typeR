library(DescTools)


### Name: TTestA
### Title: Student's t-Test Based on Sample Statistics
### Aliases: TTestA
### Keywords: htest

### ** Examples

## Classical example: Student's sleep data
mx <- 0.75
my <- 2.33
sx <- 1.789010
sy <- 2.002249
nx <- ny <- 10
TTestA(mx=mx, my=my, sx=sx, sy=sy, nx=nx, ny=ny)

# compare to
with(sleep, t.test(extra[group == 1], extra[group == 2]))



