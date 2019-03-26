library(Flury)


### Name: challenger
### Title: Challenger O Ring Data
### Aliases: challenger
### Keywords: datasets

### ** Examples

data(challenger)
## Not run: 
##D ch <- glm(cbind(Damage, 6-Damage) ~ Temp, family = binomial, data = challenger)
##D with(challenger, plot(Temp, Damage/6))
##D lines(challenger$Temp, predict(ch, type = "response")  )
##D abline(v=32, col = "red", lwd = 2)## temp when challenger launched
## End(Not run)



