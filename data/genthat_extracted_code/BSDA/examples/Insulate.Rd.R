library(BSDA)


### Name: Insulate
### Title: Heat loss through a new insulating medium
### Aliases: Insulate
### Keywords: datasets

### ** Examples


plot(loss ~ temp, data = Insulate)
model <- lm(loss ~ temp, data = Insulate)
abline(model, col = "blue") 
summary(model)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Insulate, aes(x = temp, y = loss)) + 
##D            geom_point() + 
##D            geom_smooth(method = "lm", se = FALSE) + 
##D            theme_bw()
## End(Not run)




