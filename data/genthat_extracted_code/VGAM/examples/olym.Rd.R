library(VGAM)


### Name: olympics
### Title: 2008 and 2012 Summer Olympic Final Medal Count Data
### Aliases: olym08 olym12
### Keywords: datasets

### ** Examples

summary(olym08)
summary(olym12)
## maybe str(olym08) ; plot(olym08) ...
## Not run: 
##D  par(mfrow = c(1, 2))
##D myylim <- c(0, 55)
##D with(head(olym08, n = 8),
##D barplot(rbind(gold, silver, bronze),
##D         col = c("gold", "grey", "brown"),  # No "silver" or "bronze"!
##D #               "gold", "grey71", "chocolate4",
##D         names.arg = country, cex.names = 0.5, ylim = myylim,
##D         beside = TRUE, main = "2008 Summer Olympic Final Medal Count",
##D         ylab = "Medal count", las = 1,
##D         sub = "Top 8 countries; 'gold'=gold, 'grey'=silver, 'brown'=bronze"))
##D with(head(olym12, n = 8),
##D barplot(rbind(gold, silver, bronze),
##D         col = c("gold", "grey", "brown"),  # No "silver" or "bronze"!
##D         names.arg = country, cex.names = 0.5, ylim = myylim,
##D         beside = TRUE, main = "2012 Summer Olympic Final Medal Count",
##D         ylab = "Medal count", las = 1,
##D         sub = "Top 8 countries; 'gold'=gold, 'grey'=silver, 'brown'=bronze")) 
## End(Not run)



