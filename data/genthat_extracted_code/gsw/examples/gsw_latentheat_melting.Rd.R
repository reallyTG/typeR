library(gsw)


### Name: gsw_latentheat_melting
### Title: Latent Heat of Melting
### Aliases: gsw_latentheat_melting

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(      10,      50,     125,     250,     600,    1000)
lh <- gsw_latentheat_melting(SA, p)
expect_equal(lh/1e5, c(3.299496680271213, 3.298613352397986, 3.297125622834541,
                     3.294973895330757, 3.288480445559747, 3.280715862416388))



