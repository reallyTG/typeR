library(gsw)


### Name: gsw_enthalpy
### Title: Specific enthalpy of seawater (75-term equation)
### Aliases: gsw_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <-c( 28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
e <- gsw_enthalpy(SA, CT, p)
expect_equal(e/1e5, c(1.151031813559086, 1.140146926828028, 0.921800138366058,
                    0.432553713026279, 0.330871609742468, 0.269706841603465))



