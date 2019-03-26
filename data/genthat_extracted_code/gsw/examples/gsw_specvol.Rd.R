library(gsw)


### Name: gsw_specvol
### Title: Specific Volume of Seawater
### Aliases: gsw_specvol

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
specvol <- gsw_specvol(SA, CT, p)
expect_equal(specvol*1e3, c(0.978626852431313, 0.978222365701325, 0.976155264597929,
                          0.972961258011157, 0.971026719344908, 0.968989944622149))



