library(languageR)


### Name: periphrasticDo
### Title: The development of periphrastic do in English
### Aliases: periphrasticDo
### Keywords: datasets

### ** Examples
## Not run: 
##D data(periphrasticDo)
##D 
##D # add midpoints of time periods
##D 
##D periphrasticDo$year = periphrasticDo$begin +
##D   (periphrasticDo$end-periphrasticDo$begin)/2
##D 
##D # and ad an indicator variable distinguishing the first three time periods
##D # from the others
##D 
##D periphrasticDo$Indicator = rep(c(rep(0, 3), rep(1, 8)), 4)
##D 
##D # fit a logistic regression model
##D 
##D periphrasticDo.glm = glm(cbind(do, other) ~
##D (year + I(year^2) + I(year^3)) * type + Indicator * type + 
##D Indicator * year, data = periphrasticDo, family = "binomial")
##D 
##D anova(periphrasticDo.glm, test = "F")
##D 
##D # visualization of data and model predictions
##D 
##D periphrasticDo$predict = predict(periphrasticDo.glm, type = "response")
##D par(mfrow=c(2, 2))
##D for (i in 1:nlevels(periphrasticDo$type)) {
##D   subset = periphrasticDo[periphrasticDo$type == 
##D     levels(periphrasticDo$type)[i], ]
##D   plot(subset$year,
##D     subset$do/(subset$do + subset$other), 
##D     type = "p", ylab = "proportion", xlab = "year", 
##D     ylim = c(0, 1), xlim = c(1400, 1700))
##D   mtext(levels(periphrasticDo$type)[i], line = 2)
##D   lines(subset$year, subset$predict, lty = 1)
##D }
##D par(mfrow=c(1, 1))
##D 
## End(Not run)


