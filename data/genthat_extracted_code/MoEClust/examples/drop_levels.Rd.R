library(MoEClust)


### Name: drop_levels
### Title: Drop unused factor levels to predict from unseen data
### Aliases: drop_levels
### Keywords: utility

### ** Examples

data(ais)
hema  <- as.matrix(ais[,3:7])
BMI   <- ais$BMI
sport <- ais$sport
sub   <- ais$sport != "Row"

# Fit a linear model
mod   <- lm(hema ~ BMI + sport, data=ais, subset=sub)

# Make predictions
pred1 <- try(predict(mod, newdata=ais), silent=TRUE)
inherits(pred1, "try-error") #TRUE

# Remove unused levels and try again
pred2 <- try(predict(mod, newdata=drop_levels(mod, ais)), silent=TRUE)
inherits(pred2, "try-error") #FALSE
anyNA(pred2)                 #TRUE



