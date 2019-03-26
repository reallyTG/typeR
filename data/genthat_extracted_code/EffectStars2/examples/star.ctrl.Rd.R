library(EffectStars2)


### Name: star.ctrl
### Title: Control function for effect stars.
### Aliases: star.ctrl

### ** Examples

## Not run: 
##D data(election) 
##D library(VGAM)
##D 
##D m_elect <- vglm(Partychoice ~ Gender + West + Age + Union + Highschool + Unemployment
##D + Pol.Interest + Democracy + Religion, family = multinomial(), data = election)
##D 
##D ctrl <- star.ctrl(col.labels = c("black","red2","yellow2","green2","darkred"), 
##D col.star = "darkgray", col.fill = "lightblue", col.circle = "darkgray", 
##D cex.labels = 1.1)
##D 
##D effectstars(m_elect, control = ctrl)
## End(Not run)




