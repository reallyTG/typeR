library(gsw)


### Name: gsw_t_deriv_chem_potential_water_t_exact
### Title: Derivative of Chemical Potential of Water in Seawater wrt
###   Temperature
### Aliases: gsw_t_deriv_chem_potential_water_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
d <- gsw_t_deriv_chem_potential_water_t_exact(SA, t, p)
expect_equal(d, c(-0.428798278908442, -0.423860344327343, -0.345277821010421,
                -0.164446485487145, -0.114228046736087, -0.076990819658255))



