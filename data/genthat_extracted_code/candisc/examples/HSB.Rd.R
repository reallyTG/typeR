library(candisc)


### Name: HSB
### Title: High School and Beyond Data
### Aliases: HSB
### Keywords: datasets

### ** Examples

str(HSB)
# main effects model
hsb.mod <- lm( cbind(read, write, math, sci, ss) ~
		gender + race + ses + sch + prog, data=HSB)
Anova(hsb.mod)

# Add some interactions
hsb.mod1 <- update(hsb.mod, . ~ . + gender:race + ses:prog)
heplot(hsb.mod1, col=palette()[c(2,1,3:6)], variables=c("read","math"))

hsb.can1 <- candisc(hsb.mod1, term="race")
heplot(hsb.can1, col=c("red", "black"))

# show canonical results for all terms
## Not run: 
##D hsb.can <- candiscList(hsb.mod)
##D hsb.can
## End(Not run)




