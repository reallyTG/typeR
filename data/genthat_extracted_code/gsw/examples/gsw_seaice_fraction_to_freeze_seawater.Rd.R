library(gsw)


### Name: gsw_seaice_fraction_to_freeze_seawater
### Title: Sea ice Fraction to Cool Seawater to Freezing
### Aliases: gsw_seaice_fraction_to_freeze_seawater

### ** Examples

SA <- c(      34.7118, 34.8915, 35.0256, 34.8472, 34.7366,  34.7324)
CT <- c(      -1.7856, -1.4329, -1.8103, -1.2600, -0.6886,   0.4403)
p <- c(            10,      50,     125,     250,     600,     1000)
SA_seaice <- c(     5,     4.8,     3.5,     2.5,       1,      0.4)
t_seaice <- c(-5.7856, -4.4329, -3.8103, -4.2600, -3.8863,  -3.4036)
r <- gsw_seaice_fraction_to_freeze_seawater(SA, CT, p, SA_seaice, t_seaice)
expect_equal(r$SA_freeze, c(34.671271207148074, 34.703449677481224, 34.950192062047861,
                          34.525277379661880, 34.077349518029997, 33.501836583274191))
expect_equal(r$CT_freeze, c(-1.895419711000293, -1.927935638317893, -1.999943183939312,
                          -2.071677444370745, -2.318866154643864, -2.603185031462614))
expect_equal(r$w_seaice, c(0.001364063868629, 0.006249283768465, 0.002391958850970,
                         0.009952101583387, 0.019541106156815, 0.035842627277027))



