library(gsw)


### Name: gsw_alpha_wrt_t_exact
### Title: Thermal expansion coefficient with respect to in-situ
###   temperature
### Aliases: gsw_alpha_wrt_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <-  c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
alpha_wrt_t_exact <- gsw_alpha_wrt_t_exact(SA,t,p)
expect_equal(alpha_wrt_t_exact*1e3, c(0.325601747227247, 0.323448083851267, 0.281413883319329,
                                    0.172825692975230, 0.145569941503599, 0.128362986933288))



