library(fastR)


### Name: palettes
### Title: Palette repair data
### Aliases: palettes
### Keywords: datasets

### ** Examples


data(palettes)
# Do the employees differ in the rate at which they repair palettes?
pal.lm1 <- lm(palettes~employee,palettes) 
anova(pal.lm1)
# Now using day as a blocking variable
pal.lm2 <- lm(palettes~employee+day,palettes) 
anova(pal.lm2)
xyplot(palettes~day, data=palettes,
		groups=employee,
		main="Productivity by day and employee",
		type='b',auto.key=list(columns=4,points=FALSE,lines=TRUE))




