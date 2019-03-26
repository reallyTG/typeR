library(gsw)


### Name: gsw_enthalpy_t_exact
### Title: Seawater Specific Enthalpy in terms of in-situ Temperature
### Aliases: gsw_enthalpy_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
e <- gsw_enthalpy_t_exact(SA, t, p)
expect_equal(e/1e5, c(1.151032604783763, 1.140148036012021, 0.921799209310966,
                    0.432553283808897, 0.330872159700175, 0.269705880448018))



