library(gsw)


### Name: gsw_enthalpy_first_derivatives
### Title: First Derivatives of Enthalpy
### Aliases: gsw_enthalpy_first_derivatives

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
d <- gsw_enthalpy_first_derivatives(SA, CT, p)
expect_equal(d$h_SA, c(-0.070223912348929, -0.351159768365102, -0.887025065692568,
                     -1.829602387915694, -4.423463748270238, -7.405100077558673))
expect_equal(d$h_CT/1e3, c(3.991899705530481, 3.992025640520101, 3.992210365030743,
                         3.992284150250490, 3.992685389122658, 3.993014168534175))



