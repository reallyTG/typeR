library(heplots)


### Name: Bees
### Title: Captive and maltreated bees
### Aliases: Bees
### Keywords: datasets

### ** Examples

data(Bees)
require(car)

# 3-way factorial, ignoring 0 group
bees.mod <- lm(cbind(Iz,Iy) ~ caste*treat*time, data=Bees)
Anova(bees.mod)

op<-palette(c(palette()[1:4],"brown","magenta", "olivedrab","darkgray"))
heplot(bees.mod, xlab="Iz: Ovarian development", ylab="Iz: Ovarian reabsorption",
		main="Bees: ~caste*treat*time")
heplot(bees.mod, xlab="Iz: Ovarian development", ylab="Iz: Ovarian reabsorption",
       main="Bees: ~caste*treat*time", size="effect")

# two-way design, using trtime
bees.mod1 <- lm(cbind(Iz,Iy) ~ caste*trtime, data=Bees)
Anova(bees.mod1)

heplot(bees.mod1, xlab="Iz: Ovarian development", ylab="Iz: Ovarian reabsorption",
		main="Bees: ~caste*trtime")
heplot(bees.mod1, xlab="Iz: Ovarian development", ylab="Iz: Ovarian reabsorption",
       main="Bees: ~caste*trtime",size="effect")
palette(op)

# effect plots for separate responses
if(require(effects)) {
	bees.lm1 <-lm(Iy ~ treat*caste*time, data=Bees)
	bees.lm2 <-lm(Iz ~ treat*caste*time, data=Bees)
	
	bees.eff1 <- allEffects(bees.lm1)
	plot(bees.eff1,multiline=TRUE,ask=FALSE)
	
	bees.eff2 <- allEffects(bees.lm2)
	plot(bees.eff2,multiline=TRUE,ask=FALSE)
}




