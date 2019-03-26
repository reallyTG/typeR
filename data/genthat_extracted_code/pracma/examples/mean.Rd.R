library(pracma)


### Name: geomean, harmmean
### Title: Geometric and Harmonic Mean (Matlab Style)
### Aliases: geomean harmmean trimmean
### Keywords: stat

### ** Examples

A <- matrix(1:12, 3, 4)
geomean(A, dim = 1)
## [1]  1.817121  4.932424  7.958114 10.969613
harmmean(A, dim = 2)
## [1] 2.679426 4.367246 5.760000

x <- c(-0.98, -0.90, -0.68, -0.61, -0.61, -0.38, -0.37, -0.32, -0.20, -0.16,
        0.00,  0.05,  0.12,  0.30,  0.44,  0.77,  1.37,  1.64,  1.72,  2.80)
trimmean(x); trimmean(x, 20)    # 0.2  0.085
mean(x); mean(x, 0.10)          # 0.2  0.085



