library(semTools)


### Name: bsBootMiss
### Title: Bollen-Stine Bootstrap with the Existence of Missing Data
### Aliases: bsBootMiss

### ** Examples


## Not run: 
##D dat1 <- HolzingerSwineford1939
##D dat1$x5 <- ifelse(dat1$x1 <= quantile(dat1$x1, .3), NA, dat1$x5)
##D dat1$x9 <- ifelse(is.na(dat1$x5), NA, dat1$x9)
##D 
##D targetModel <- "
##D visual  =~ x1 + x2 + x3
##D textual =~ x4 + x5 + x6
##D speed   =~ x7 + x8 + x9
##D "
##D targetFit <- sem(targetModel, dat1, meanstructure = TRUE, std.lv = TRUE,
##D                  missing = "fiml", group = "school")
##D summary(targetFit, fit = TRUE, standardized = TRUE)
##D 
##D # The number of bootstrap samples should be much higher.
##D temp <- bsBootMiss(targetFit, transformation = 1, nBoot = 10, seed = 31415)
##D 
##D temp
##D summary(temp)
##D hist(temp)
##D hist(temp, printLegend = FALSE) # suppress the legend
##D ## user can specify alpha level (default: alpha = 0.05), and the number of
##D ## digits to display (default: nd = 2).  Pass other arguments to hist(...),
##D ## or a list of arguments to legend() via "legendArgs"
##D hist(temp, alpha = .01, nd = 3, xlab = "something else", breaks = 25,
##D      legendArgs = list("bottomleft", box.lty = 2))
## End(Not run)




