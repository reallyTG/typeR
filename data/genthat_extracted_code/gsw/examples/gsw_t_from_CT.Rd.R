library(gsw)


### Name: gsw_t_from_CT
### Title: In situ temperature from Conservative Temperature
### Aliases: gsw_t_from_CT

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <-  c(     10,      50,     125,     250,     600,    1000)
t <- gsw_t_from_CT(SA, CT, p)
expect_equal(t, c(28.785580227725703, 28.432872246163946, 22.810323087627076,
                  10.260010752788906, 6.886286301029376, 4.403624452383043))



