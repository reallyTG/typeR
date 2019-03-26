library(npROCRegression)


### Name: DNPROCreg
### Title: Direct nonparametric ROC regression modelling
### Aliases: DNPROCreg

### ** Examples

data(endosim)
# Fit a model including the interaction between age and gender.
m0 <- DNPROCreg(marker = "bmi", formula.h = "~ gender + s(age) + s(age, by = gender)", 
				formula.ROC = "~ gender + s(age) + s(age, by = gender)", 
				group = "idf_status", 
				tag.healthy = 0, 
				data = endosim, 
				control = list(card.P=50, kbin=30, step.p=0.02))
summary(m0)				
plot(m0)

## Not run: 
##D # For confidence intervals
##D set.seed(123)
##D m1 <- DNPROCreg(marker = "bmi", formula.h = "~ gender + s(age) + s(age, by = gender)", 
##D 				formula.ROC = "~ gender + s(age) + s(age, by = gender)", 
##D 				group = "idf_status", 
##D 				tag.healthy = 0, 
##D 				data = endosim, 
##D 				control = list(card.P=50, kbin=30, step.p=0.02),
##D 				ci.fit = TRUE)
##D summary(m1)
##D plot(m1)
##D 
##D # For testing the presence of interaccion between age and gender
##D set.seed(123)
##D m2 <- DNPROCreg(marker = "bmi", formula.h = "~ gender + s(age) + s(age, by = gender)", 
##D 				formula.ROC = "~ gender + s(age) + s(age, by = gender)", 
##D 				group = "idf_status", 
##D 				tag.healthy = 0, 
##D 				data = endosim, 
##D 				control = list(card.P=50, kbin=30, step.p=0.02),
##D 				test.partial = 3)
##D summary(m2)
##D plot(m2)			
## End(Not run)



