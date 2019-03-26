library(gsw)


### Name: gsw_t_freezing
### Title: Freezing Temperature of Seawater
### Aliases: gsw_t_freezing

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(      10,      50,     125,     250,     600,    1000)
saturation_fraction <- 1
tf <- gsw_t_freezing(SA, p, saturation_fraction)
expect_equal(tf, c(-1.902730710149803, -1.942908619287183, -2.006861069199743,
                   -2.090985086875259, -2.351293130342102, -2.660498762776720))



