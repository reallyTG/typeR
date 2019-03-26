library(pubh)


### Name: strip_error
### Title: Strip plots with error bars.
### Aliases: strip_error

### ** Examples

data(energy, package="ISwR")
strip_error(expend ~ stature, data = energy, xlab = "Stature", ylab = "Energy expenditure (MJ)")

## Adding an horizontal line to show significant difference:
fig <- strip_error(expend~stature, data=energy, xlab="Stature",
                   ylab="Energy expenditure (MJ)", ylim=c(5.5,14))
fig + layer(panel.segments(1, 13.3, 2, 13.3, lwd=1.5)) + layer(panel.text(1.5, 13.5, "*"))

data(birthwt, package = "MASS")
birthwt$smoke <- factor(birthwt$smoke, labels = c("Non-smoker", "Smoker"))
birthwt$Race <- factor(birthwt$race > 1, labels = c("White", "Non-white"))
strip_error(bwt ~ Race|smoke, data = birthwt, ylab = "Birth weight (g)")



