library(CTT)


### Name: disattenuated.cor
### Title: Function for disattentuated correlation
### Aliases: disattenuated.cor
### Keywords: misc

### ** Examples


# r.xy=0.6, r.xx=0.7,r.yy=0.8
disattenuated.cor(0.6,c(0.7,0.8))

# if r.xy is a matrix:
cor1 <- matrix(c(1.0000000, 0.24391288, 0.2812319, 0.05251050,
                 0.2439129, 1.00000000, 0.1652985, 0.08126448,
                 0.2812319, 0.16529850, 1.0000000, 0.27971630,
                 0.0525105, 0.08126448, 0.2797163, 1.00000000), byrow=TRUE,
                 ncol=4)

rxx1 <- c(0.8,0.8,0.81,0.9)     # reliability of each test 
new.rxx1 <- c(0.9,0.97,0.8,0.7) # projected new reliability of those tests

disattenuated.cor(cor1, rxx1, new.rxx1)



