library(npROCRegression)


### Name: DNPROCregData
### Title: Selects an adequate set of points from a data set for obtaining
###   predictions or plots.
### Aliases: DNPROCregData

### ** Examples

data(endosim)
# Fit a model including the interaction between age and gender.
m0 <- DNPROCreg(marker = "bmi", formula.h = "~ gender + s(age) + s(age, by = gender)", 
				formula.ROC = "~ gender + s(age) + s(age, by = gender)", 
				group = "idf_status", 
				tag.healthy = 0, 
				data = endosim, 
				control = list(card.P=50, kbin=30, step.p=0.02), 
				ci.fit = FALSE, 
				test.partial = NULL,
				newdata = NULL)
summary(m0)				
plot(m0)			 



