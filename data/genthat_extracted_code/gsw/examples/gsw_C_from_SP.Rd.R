library(gsw)


### Name: gsw_C_from_SP
### Title: Electrical Conductivity from Practical Salinity
### Aliases: gsw_C_from_SP

### ** Examples

SP <- c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
C <- gsw_C_from_SP(SP, t, p)
expect_equal(C, c(56.412599581571186, 56.316185602699953, 50.670369333973944,
                  38.134518936104350, 35.056577637635257, 32.986550607990118))



