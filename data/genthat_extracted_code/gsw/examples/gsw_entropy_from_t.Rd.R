library(gsw)


### Name: gsw_entropy_from_t
### Title: Specific Entropy i.t.o. Absolute Salinity, Temperature, and
###   Pressure
### Aliases: gsw_entropy_from_t

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
e <- gsw_entropy_from_t(SA, t, p)
expect_equal(e/1e2, c(4.003894252787245, 3.954381784340642, 3.198664981986740,
                    1.467908815899072, 0.986473408657975, 0.627915087346090))



