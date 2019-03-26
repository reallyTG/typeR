library(ROCit)


### Name: Diabetes
### Title: Diabetes Data
### Aliases: Diabetes
### Keywords: datasets

### ** Examples

data("Diabetes")
plot(Diabetes$hdl~Diabetes$weight, pch = 16,
       col =ifelse(Diabetes$gender=="male",1,2))
#------------------------------------------
## density plot
femaleBMI <- density(subset(Diabetes, gender == "female")$bmi, na.rm = TRUE)
maleBMI <- density(subset(Diabetes, gender == "male")$bmi, na.rm = TRUE)
## -------
plot(NULL, ylim = c(0,0.08), xlim = c(10,60),
     xlab = "BMI", ylab = "Density", main = "")
grid(col = 1)
polygon(maleBMI, col = rgb(0,0,1,0.2), border = 4)
polygon(femaleBMI, col = rgb(1,0,0,0.2), border = 2)
abline(h = 0)
legend("topright", c("Male", "Female"), pch = 15,
       col = c(rgb(0,0,1,0.2), rgb(1,0,0,0.2)), bty = "n")
#------------------------------------------
logistic.model <- glm(as.factor(dtest)~chol+age+bmi,
                      data = Diabetes,family = "binomial")
summary(logistic.model)
#------------------------------------------
class <- logistic.model$y
score <- logistic.model$fitted.values
rocit_object <- rocit(score = score, class = class)
summary(rocit_object)
plot(rocit_object)



