library(EffectStars)


### Name: PID
### Title: Party Identification
### Aliases: PID
### Keywords: datasets multinomial response

### ** Examples

## Not run: 
##D data(PID)
##D PID$TVnews <- scale(PID$TVnews)
##D PID$Income <- scale(PID$Income)
##D PID$Age <- scale(PID$Age)
##D PID$Population <- scale(PID$Population)
##D 
##D star.nominal(PID ~ TVnews + Income + Population + Age + Education, data = PID)
## End(Not run)
 


