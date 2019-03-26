library(gsw)


### Name: gsw_melting_ice_into_seawater
### Title: Calculate properties related to ice melting in seawater
### Aliases: gsw_melting_ice_into_seawater

### ** Examples

SA <- c(  34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(   4.7856,  2.4329,  1.8103,  1.2600,  0.6886,  0.4403)
p <- c(        10,      50,     125,     250,     600,    1000)
w_Ih <- c( 0.0560, 0.02513, 0.02159, 0.01210, 0.00943, 0.00751)
t_Ih <- c(-4.7856, -4.4329, -3.8103, -4.2600, -3.8863, -3.4036)
r <- gsw_melting_ice_into_seawater(SA, CT, p, w_Ih, t_Ih)
expect_equal(r$SA_final, c(32.767939199999994, 34.014676604999998, 34.269397295999994,
                           34.425548880000001, 34.409033862000001, 34.471559675999998))
expect_equal(r$CT_final, c(-0.298448911022612, 0.215263001418312, -0.074341719211557,
                           0.207796293045473, -0.123785388299875, -0.202531182809225))
expect_equal(r$w_Ih_final, rep(0, 6))



