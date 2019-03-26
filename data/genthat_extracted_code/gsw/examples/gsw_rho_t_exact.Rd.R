library(gsw)


### Name: gsw_rho_t_exact
### Title: In-situ Density of Seawater
### Aliases: gsw_rho_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <-  c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
rho <- gsw_rho_t_exact(SA, t, p)
expect_equal(rho/1e3, c(1.021840173185531, 1.022262689926782, 1.024427715941676,
                      1.027790201811623, 1.029837714725961, 1.032002404116447))



