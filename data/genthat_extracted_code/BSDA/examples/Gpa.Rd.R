library(BSDA)


### Name: Gpa
### Title: High school GPA versus college GPA
### Aliases: Gpa
### Keywords: datasets

### ** Examples


plot(collgpa ~ hsgpa, data = Gpa)
mod <- lm(collgpa ~ hsgpa, data = Gpa)
abline(mod)               # add line
yhat <- predict(mod)      # fitted values
e <- resid(mod)           # residuals
cbind(Gpa, yhat, e)       # Table 2.1
cor(Gpa$hsgpa, Gpa$collgpa)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Gpa, aes(x = hsgpa, y = collgpa)) + 
##D            geom_point() + 
##D            geom_smooth(method = "lm") + 
##D            theme_bw()
## End(Not run)





