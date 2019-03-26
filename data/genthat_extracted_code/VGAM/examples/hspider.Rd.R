library(VGAM)


### Name: hspider
### Title: Hunting Spider Data
### Aliases: hspider
### Keywords: datasets

### ** Examples

summary(hspider)

## Not run: 
##D # Standardize the environmental variables:
##D hspider[, 1:6] <- scale(subset(hspider, select = WaterCon:ReflLux))
##D 
##D # Fit a rank-1 binomial CAO
##D hsbin <- hspider  # Binary species data
##D hsbin[, -(1:6)] <- as.numeric(hsbin[, -(1:6)] > 0)
##D set.seed(123)
##D ahsb1 <- cao(cbind(Alopcune, Arctlute, Auloalbi, Zoraspin) ~
##D              WaterCon + ReflLux,
##D              family = binomialff(multiple.responses = TRUE),
##D              df1.nl = 2.2, Bestof = 3, data = hsbin)
##D par(mfrow = 2:1, las = 1)
##D lvplot(ahsb1, type = "predictors", llwd = 2, ylab = "logit p", lcol = 1:9)
##D persp(ahsb1, rug = TRUE, col = 1:10, lwd = 2)
##D coef(ahsb1)
## End(Not run)



