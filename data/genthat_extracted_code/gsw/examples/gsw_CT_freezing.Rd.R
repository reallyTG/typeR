library(gsw)


### Name: gsw_CT_freezing
### Title: Conservative Temperature of Freezing Seawater
### Aliases: gsw_CT_freezing

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <-  c(     10,      50,     125,     250,     600,    1000)
saturation_fraction <- 1
CT <- gsw_CT_freezing(SA, p, saturation_fraction)
expect_equal(CT, c(-1.899683776424096, -1.940791867869104, -2.006240664432488,
                 -2.092357761318778, -2.359300831770506, -2.677162675412748))



