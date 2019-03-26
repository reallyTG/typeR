library(gsw)


### Name: gsw_beta_const_t_exact
### Title: Haline contraction coefficient at constant in-situ temperature
### Aliases: gsw_beta_const_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
b <- gsw_beta_const_t_exact(SA, t, p)
expect_equal(b*1e3, c(0.731120837010429, 0.731071779078011, 0.736019128913071,
                    0.753810501711847, 0.757259405338257, 0.758649268096996))



