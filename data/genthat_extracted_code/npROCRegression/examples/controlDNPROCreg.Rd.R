library(npROCRegression)


### Name: controlDNPROCreg
### Title: Function used to set several parameters controlling the ROC
###   regression fitting process
### Aliases: controlDNPROCreg

### ** Examples

data(endosim)
# Fit a model including the interaction between age and gender.
m0 <- DNPROCreg(marker = "bmi", formula.h = "~ gender + s(age) + s(age, by = gender)", 
				formula.ROC = "~ gender + s(age) + s(age, by = gender)", 
				group = "idf_status", 
				tag.healthy = 0, 
				data = endosim, 
				control = controlDNPROCreg(card.P=50, kbin=30, step.p=0.02))
summary(m0)				
plot(m0)



