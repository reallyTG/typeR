library(MPV)


### Name: Uplot
### Title: Plot of Multipliers in Regression ANOVA Plot
### Aliases: Uplot
### Keywords: graphics

### ** Examples

# Jojoba oil data set
X <- p4.18[,-4]
Uplot(X, 1:4)
# NFL data set; see GFplot result first
X <- table.b1[,-1]
Uplot(X, c(2,3,9))
# In this example, x8 is the only predictor in
# the true model:
X <- pathoeg[,-10]
y <- pathoeg[,10]
pathoeg.F <- GFplot(X, y, plotIt=FALSE)
Uplot(X, "x8")
Uplot(X, 9) # same as above
Uplot(pathoeg.F$QR, 9) # same as above
X <- table.b1[,-1]
Uplot(X, c("x2", "x3", "x9"))



