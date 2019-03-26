library(mapfit)


### Name: herlang-class
### Title: Class of hyper Erlang
### Aliases: herlang-class
### Keywords: classes

### ** Examples

## create a hyper Erlang consisting of two Erlang
## with shape parameters 2 and 3.
(param1 <- herlang(c(2,3)))

## create a hyper Erlang consisting of two Erlang
## with shape parameters 2 and 3.
(param1 <- herlang(shape=c(2,3)))

## create a hyper Erlang with specific parameters
(param2 <- herlang(shape=c(2,3), mixrate=c(0.3,0.7),
                   rate=c(1.0,10.0)))

## convert to a general PH
as(param2, "ph")

## p.d.f. for 0, 0.1, ..., 1
(dherlang(x=seq(0, 1, 0.1), herlang=param2))

## c.d.f. for 0, 0.1, ..., 1
(pherlang(q=seq(0, 1, 0.1), herlang=param2))

## generate 10 samples
(rherlang(n=10, herlang=param2))




