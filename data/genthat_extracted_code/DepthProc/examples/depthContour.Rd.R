library(DepthProc)


### Name: depthContour
### Title: Approximate depth contours
### Aliases: depthContour
### Keywords: contour depth

### ** Examples

# EXAMPLE 1
x <- mvrnorm(1000, c(0, 0), diag(2))
depthContour(x, colors = gray.colors)
# with points
depthContour(x, points = TRUE)
depthContour(x, points = FALSE, levels = 10)

# EXAMPLE 2
data(inf.mort, maesles.imm)
data1990 <- na.omit(cbind(inf.mort[, 1], maesles.imm[, 1]))
depthContour(data1990, n = 50, pmean = TRUE, mcol = "blue",
             pdmedian = TRUE, mecol = "brown", legend = TRUE, points = TRUE,
             depth_params = list(method = "LP"),
             graph_params = list(
               xlab = "infant mortality rate per 1000 live birth",
               ylab = "against masles immunized percentage",
               main = "L2 depth, UN Fourth Goal 2011 year"))




