library(gsw)


### Name: gsw_specvol_t_exact
### Title: Specific Volume of Seawater
### Aliases: gsw_specvol_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
v <- gsw_specvol_t_exact(SA, t, p)
expect_equal(v*1e3, c(0.978626625025472, 0.978222143734527, 0.976154768597586,
                    0.972961211575438, 0.971026779948624, 0.968989990731808))



