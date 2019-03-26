library(heplots)


### Name: schooldata
### Title: School Data
### Aliases: schooldata
### Keywords: datasets

### ** Examples

data(schooldata)
# initial screening
plot(schooldata)

# better plot
library(corrgram)
corrgram(schooldata, lower.panel=panel.ellipse, upper.panel=panel.pts)

#fit the MMreg model
school.mod <- lm(cbind(reading, mathematics, selfesteem) ~ 
		education + occupation + visit + counseling + teacher, data=schooldata)
# shorthand
school.mod <- lm(cbind(reading, mathematics, selfesteem) ~ ., data=schooldata)
Anova(school.mod)

heplot(school.mod)
heplot3d(school.mod)

# robust model, using robmlm()
school.rmod <- robmlm(cbind(reading, mathematics, selfesteem) ~ ., data=schooldata)
# note that counseling is now significant
Anova(school.rmod)

# compare classical HEplot with robust
heplot(school.mod, cex=1.4, lty=1, fill=TRUE, fill.alpha=0.1)
heplot(school.rmod, add=TRUE, error.ellipse=TRUE, lwd=c(2,2), lty=c(2,2), 
	term.labels=FALSE, err.label="", fill=TRUE)





