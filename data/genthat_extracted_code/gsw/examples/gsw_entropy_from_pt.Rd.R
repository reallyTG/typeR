library(gsw)


### Name: gsw_entropy_from_pt
### Title: Specific Entropy ito Absolute Salinity and Potential Temperature
### Aliases: gsw_entropy_from_pt

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
pt <- c(28.7832, 28.4210, 22.7850, 10.2305,  6.8292,  4.3245)
e <- gsw_entropy_from_pt(SA, pt)
expect_equal(e/1e2, c(4.003894674443156, 3.954383994925507, 3.198674385897981,
                    1.467905482842553, 0.986469100565646, 0.627913567234252))



