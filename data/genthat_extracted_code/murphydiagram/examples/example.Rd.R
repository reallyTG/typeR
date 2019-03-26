library(murphydiagram)


### Name: Synthetic Example
### Title: Analytical Expressions from the Synthetic Example in Section 3.3
###   and Appendix B
### Aliases: expected_score_mean expected_score_quantile
### Keywords: synthetic example

### ** Examples


## Not run: 
##D # Color palette, obtained from http://www.cookbook-r.com/Graphs/Colors_##D 
##D cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73")
##D cbbPalette <- cbbPalette[c(1, 4, 2, 3)]
##D 
##D # Labeling stuff
##D forecasters <- c("P", "C", "U", "SR")
##D names <- c("Perfect", "Climatological", "Unfocused", "Sign-Reversed")
##D x_label <- expression(paste("Parameter ", theta))
##D 
##D # Figure 2, top left
##D 
##D # Grid for theta
##D theta_grid1 <- seq(-3, 3, 0.01)
##D # Expected scores for all forecasters
##D scores1 <- sapply(forecasters, expected_score_mean, theta = theta_grid1)
##D # Plot
##D matplot(x = theta_grid1, y = scores1[, 4:1], type = "l", lty = 1, col = cbbPalette[4:1], 
##D         lwd = 2, bty = "n", xlab = x_label, ylab = expression("Expected Score"))
##D legend("topright", names, col = cbbPalette, lwd = 2, bty = "n")
## End(Not run)




