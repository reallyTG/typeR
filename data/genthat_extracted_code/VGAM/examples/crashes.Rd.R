library(VGAM)


### Name: crashes
### Title: Crashes on New Zealand Roads in 2009
### Aliases: crashi crashf crashtr crashmc crashbc crashp alcoff alclevels
### Keywords: datasets

### ** Examples

## Not run: 
##D  plot(unlist(alcoff), type = "l", frame.plot = TRUE,
##D      axes = FALSE, col = "blue", bty = "o",
##D      main = "Alcoholic offenders on NZ roads, aggregated over 2009",
##D      sub  = "Vertical lines at midnight (purple) and noon (orange)",
##D      xlab = "Day/hour", ylab = "Number of offenders")
##D axis(1, at = 1 + (0:6) * 24 + 12, labels = colnames(alcoff))
##D axis(2, las = 1)
##D axis(3:4, labels = FALSE, tick = FALSE)
##D abline(v = sort(1 + c((0:7) * 24, (0:6) * 24 + 12)), lty = "dashed",
##D        col = c("purple", "orange")) 
## End(Not run)

# Goodmans RC models
## Not run: 
##D fitgrc1 <- grc(alcoff)  # Rank-1 model
##D fitgrc2 <- grc(alcoff, Rank = 2, Corner = FALSE, Uncor = TRUE)
##D Coef(fitgrc2)
## End(Not run)
## Not run: 
##D  biplot(fitgrc2, scaleA = 2.3, Ccol = "blue", Acol = "orange",
##D        Clabels = as.character(1:23), xlim = c(-1.3, 2.3),
##D        ylim = c(-1.2, 1)) 
## End(Not run)



