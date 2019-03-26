library(gsw)


### Name: gsw_cabbeling
### Title: Cabbeling coefficient
### Aliases: gsw_cabbeling

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <-  c(     10,      50,     125,     250,     600,    1000)
cabbeling <- gsw_cabbeling(SA,CT,p)
expect_equal(cabbeling*1e4, c(0.086645721047423, 0.086837829466794, 0.092525582052438,
                            0.108884336975401, 0.112971197222338, 0.115483896148927))



