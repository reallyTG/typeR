library(gsw)


### Name: gsw_cp_t_exact
### Title: Isobaric heat capacity
### Aliases: gsw_cp_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <-  c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
cp_t_exact <- gsw_cp_t_exact(SA, t, p)
expect_equal(cp_t_exact/1e3, c(4.002888003958537, 4.000980283927373, 3.995546468894633,
                             3.985076769021370, 3.973593843482723, 3.960184084786622))



