library(gsw)


### Name: gsw_dynamic_enthalpy
### Title: Dynamic enthalpy of seawater (75-term equation)
### Aliases: gsw_dynamic_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <-c( 28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
de <- gsw_dynamic_enthalpy(SA, CT, p)
expect_equal(de/1000, c(0.097864698087770, 0.489161476686235, 1.220512192086506,
                      2.433731199531144, 5.833880057399701, 9.711443860944032))



