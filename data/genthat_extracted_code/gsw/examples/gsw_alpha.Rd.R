library(gsw)


### Name: gsw_alpha
### Title: Thermal expansion coefficient with respect to Conservative
###   Temperature
### Aliases: gsw_alpha

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
alpha <- gsw_alpha(SA,CT,p)
expect_equal(alpha*1e3, c( 0.324464211877393, 0.322610094680523, 0.281335030247435,
                        0.173529986885424, 0.146898108553385, 0.130265123640082))



