library(gsw)


### Name: gsw_pot_rho_t_exact
### Title: Potential density
### Aliases: gsw_pot_rho_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
p_ref  <- 0
prho <- gsw_pot_rho_t_exact(SA,t,p,p_ref)
expect_equal(prho/1e3, c(1.021798145811089, 1.022052484416980, 1.023893583651958,
                       1.026667621124443, 1.027107230868492, 1.027409631264134))



