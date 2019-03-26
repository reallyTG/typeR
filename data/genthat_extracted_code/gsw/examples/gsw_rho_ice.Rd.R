library(gsw)


### Name: gsw_rho_ice
### Title: In-situ density of ice
### Aliases: gsw_rho_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
rho <- gsw_rho_ice(t, p)
expect_equal(rho, c(918.2879969148962, 918.7043487325120, 918.6962796312690,
             918.7513732275766, 918.9291139833307, 919.0032237449378))



