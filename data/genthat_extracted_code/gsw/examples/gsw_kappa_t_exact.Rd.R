library(gsw)


### Name: gsw_kappa_t_exact
### Title: Isentropic compressibility of seawater (exact)
### Aliases: gsw_kappa_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <-c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
kappa <- gsw_kappa(SA, CT, p)
expect_equal(kappa*1e9, c(0.411343648791300, 0.411105416128094, 0.416566236026610,
                        0.435588650838751, 0.438782500588955, 0.439842289994702))



