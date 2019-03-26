library(EngrExpt)


### Name: diameter
### Title: Diameter of product
### Aliases: diameter
### Keywords: datasets

### ** Examples

str(diameter)
dotplot(line ~ diameter, diameter, type = c("p","a"),
        jitter.y = TRUE, aspect = 0.2, ylab = "Line",
        xlab = "Diameter of tracking ball (cm.)")
bwplot(line ~ diameter, diameter, type = c("p","a"),
       jitter.y = TRUE, aspect = 0.2, ylab = "Line",
       xlab = "Diameter of tracking ball (cm.)")



