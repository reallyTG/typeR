library(robustbase)


### Name: los
### Title: Length of Stay Data
### Aliases: los
### Keywords: datasets

### ** Examples

 summary(los) # quite skewed, with median(.) = 8
 plot(table(los))
 boxplot(los, horizontal=TRUE, add=TRUE, col = "red", axes=FALSE)
 ##-> "outliers" instead of "just skewed"

 hist(log(los))
 boxplot(log(los), add=TRUE, col=2, border=2, horizontal = TRUE, at = -1)

 ## Hubert and Vandervieren (2006), p. 15, Fig. 11.
 adjbox(los, col = "gray", staplecol="red", outcol = "red",
        main = "(Skewness-)Adjusted and original boxplot for 'los' data")
 boxplot(los, add = TRUE, staplewex= 0.2, outcex= 0.5, outpch= 4,
         staplecol = "blue", outcol = "blue", staplelwd=2)
 legend("topright", c("adjbox(los)", "boxplot(los)"),
        col=c("red","blue"), lwd = 1:2, bty="n")



