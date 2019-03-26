library(gsw)


### Name: gsw_internal_energy
### Title: Specific Internal Energy of Seawater (75-term equation)
### Aliases: gsw_internal_energy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
e <- gsw_internal_energy(SA, CT, p)
expect_equal(e/1e5, c(1.148091576956162, 1.134013145527675, 0.909571141498779,
                    0.408593072177020, 0.273985276460357, 0.175019409258405))



