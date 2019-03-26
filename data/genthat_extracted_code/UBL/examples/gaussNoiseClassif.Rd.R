library(UBL)


### Name: GaussNoiseClassif
### Title: Introduction of Gaussian Noise for the generation of synthetic
###   examples to handle imbalanced multiclass problems.
### Aliases: GaussNoiseClassif
### Keywords: pre-processing classification

### ** Examples

library(DMwR)
data(algae)
clean.algae <- algae[complete.cases(algae), ]
# autumn and summer are the most important classes and winter
# is the least important
C.perc = list(autumn = 3, summer = 1.5, winter = 0.2)
gn <- GaussNoiseClassif(season~., clean.algae, C.perc)
table(algae$season)
table(gn$season)

# another example
data(iris)
dat <- iris[, c(1, 2, 5)]
dat$Species <- factor(ifelse(dat$Species == "setosa", "rare", "common")) 
## checking the class distribution of this artificial data set
table(dat$Species)
## now using gaussian noise to create a more "balanced problem"
new.gn <- GaussNoiseClassif(Species ~ ., dat)
table(new.gn$Species)
## Checking visually the created data
 par(mfrow = c(1, 2))
 plot(dat[, 1], dat[, 2], pch = as.integer(dat[, 3]), 
      col = as.integer(dat[, 3]), main = "Original Data")
 plot(new.gn[, 1], new.gn[, 2], pch = as.integer(new.gn[, 3]),
      col = as.integer(new.gn[, 3]), main = "Data with Gaussian Noise")




