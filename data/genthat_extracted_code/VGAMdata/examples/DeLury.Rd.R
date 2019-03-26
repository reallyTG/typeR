library(VGAMdata)


### Name: DeLury
### Title: DeLury's Method for Population Size Estimation
### Aliases: DeLury
### Keywords: models

### ** Examples

pounds <- c(  147, 2796, 6888, 7723, 5330, 8839, 6324, 3569, 8120, 8084,
            8252, 8411, 6757, 1152, 1500, 11945, 6995, 5851, 3221, 6345,
            3035, 6271, 5567, 3017, 4559, 4721, 3613,  473,  928, 2784,
            2375, 2640, 3569)
traps  <- c(  200, 3780, 7174, 8850, 5793, 9504, 6655, 3685, 8202, 8585,
            9105, 9069, 7920, 1215, 1471, 11597, 8470, 7770, 3430, 7970,
            4740, 8144, 7965, 5198, 7115, 8585, 6935, 1060, 2070, 5725,
            5235, 5480, 8300)
table1 <- DeLury(pounds/1000, traps/1000)

## Not run: 
##D with(table1, plot(1+log(CPUE) ~ E, las = 1, pch = 19, main = "DeLury method",
##D      xlab = "E(t)", ylab = "1 + log(C(t))", col = "blue"))
## End(Not run)
omitIndices <- -(1:16)
table1b <- DeLury(pounds[omitIndices]/1000, traps[omitIndices]/1000)
## Not run: 
##D with(table1b, plot(1+log(CPUE) ~ E, las = 1, pch = 19, main = "DeLury method",
##D      xlab = "E(t)", ylab = "1 + log(C(t))", col = "blue"))
##D mylmfit <- with(table1b, lmfit)
##D lines(mylmfit$x[, 2], 1 + predict.lm(mylmfit), col = "red", lty = "dashed")
## End(Not run)


omitIndices <- -(1:16)
table2 <- DeLury(pounds[omitIndices]/1000, traps[omitIndices]/1000, type = "L")
## Not run: 
##D with(table2, plot(CPUE ~ K, las = 1, pch = 19,
##D      main = "Leslie method; Fig. III",
##D      xlab = "K(t)", ylab = "C(t)", col = "blue"))
##D mylmfit <- with(table2, lmfit)
##D abline(a = coef(mylmfit)[1], b = coef(mylmfit)[2],
##D        col = "orange", lty = "dashed")
## End(Not run)



