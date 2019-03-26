library(gsw)


### Name: gsw_enthalpy_diff
### Title: Specific Enthalpy Difference with Pressure
### Aliases: gsw_enthalpy_diff

### ** Examples

SA <- c(  34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(  28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p_shallow <- c(10,      50,     125,     250,     600,    1000)
p_deep <- c(  110,     150,     225,     350,     700,    1100)
ed <- gsw_enthalpy_diff(SA, CT, p_shallow, p_deep)
expect_equal(ed/1e2, c(9.784180644568052, 9.780195056105020, 9.759587700515114,
                       9.727552719534447, 9.708223170174454, 9.687871289079633))



