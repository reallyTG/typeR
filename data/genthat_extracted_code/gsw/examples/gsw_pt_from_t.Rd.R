library(gsw)


### Name: gsw_pt_from_t
### Title: Potential Temperature from in-situ Temperature
### Aliases: gsw_pt_from_t

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
p_ref <- 0
pt <- gsw_pt_from_t(SA, t, p, p_ref)
expect_equal(pt, c(28.783196819670632, 28.420983342398962, 22.784930399117108,
                   10.230523661095731, 6.829230224409661, 4.324510571845719))



