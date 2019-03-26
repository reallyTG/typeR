library(gsw)


### Name: gsw_dilution_coefficient_t_exact
### Title: Dilution coefficient
### Aliases: gsw_dilution_coefficient_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
dc <- gsw_dilution_coefficient_t_exact(SA, t, p)
expect_equal(dc, c(79.140034211532040, 79.104983526833820, 77.503312016847389,
                 73.535062653715272, 72.483378545466564, 71.760667498673087))



