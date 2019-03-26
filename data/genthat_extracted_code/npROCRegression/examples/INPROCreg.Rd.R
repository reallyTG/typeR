library(npROCRegression)


### Name: INPROCreg
### Title: Induced nonparametric ROC regression modelling
### Aliases: INPROCreg

### ** Examples

data(endosim)
# Evaluate the effect of age on the accuracy of the body mass index for males
m0.men <- INPROCreg(marker = "bmi", covariate = "age", group = "idf_status", 
						tag.healthy = 0, 
						data = subset(endosim, gender == "Men"), 
						ci.fit = FALSE, test = FALSE, 
						accuracy = c("EQ","TH"),
						accuracy.cal="AROC", 
						control=controlINPROCreg(p=1,kbin=30,step.p=0.01), 
						newdata = data.frame(age = seq(18,85,l=50)))	

summary(m0.men)
plot(m0.men)
# Evaluate the effect of age on the accuracy of the body mass index for females
m0.women <- INPROCreg(marker = "bmi", covariate = "age", group = "idf_status", 
						tag.healthy = 0, 
						data = subset(endosim, gender == "Women"), 
						ci.fit = FALSE, test = FALSE, 
						accuracy = c("EQ","TH"),
						accuracy.cal="ROC", 
						control=controlINPROCreg(p=1,kbin=30,step.p=0.01), 
						newdata = data.frame(age = seq(18,85,l=50)))
						
summary(m0.women)						
plot(m0.women)
## Not run: 
##D # For computing confidence intervals and testing covariate effect
##D set.seed(123)
##D m1.men <- INPROCreg(marker = "bmi", covariate = "age", group = "idf_status", 
##D 						tag.healthy = 0, 
##D 						data = subset(endosim, gender == "Men"), 
##D 						ci.fit = TRUE, test = TRUE, 
##D 						accuracy = c("EQ","TH"),
##D 						accuracy.cal="AROC", 
##D 						control=controlINPROCreg(p=1,kbin=30,step.p=0.01), 
##D 						newdata = data.frame(age = seq(18,85,l=50)))
##D summary(m1.men)
##D plot(m1.men)					
## End(Not run)



