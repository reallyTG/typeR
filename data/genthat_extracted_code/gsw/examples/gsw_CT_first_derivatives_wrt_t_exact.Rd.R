library(gsw)


### Name: gsw_CT_first_derivatives_wrt_t_exact
### Title: Derivatives of Conservative Temperature with Respect to or at
###   Constant in-situ Temperature
### Aliases: gsw_CT_first_derivatives_wrt_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_CT_first_derivatives_wrt_t_exact(SA, t, p)
expect_equal(r$CT_SA_wrt_t, c(-0.041988694538987, -0.041596549088952, -0.034853545749326,
                            -0.019067140454607, -0.015016439826591, -0.012233725491373))
expect_equal(r$CT_t_wrt_t, c(1.002752642867571, 1.002243118597902, 1.000835702767227,
                           0.998194915250648, 0.995219303532390, 0.991780205482695))
expect_equal(r$CT_p_wrt_t/1e-7, c(-0.241011880838437, -0.239031676279078, -0.203649928441505,
                                -0.119370679226136, -0.099140832825342, -0.086458168643579))



