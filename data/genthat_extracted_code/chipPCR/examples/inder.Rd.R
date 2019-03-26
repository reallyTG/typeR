library(chipPCR)


### Name: inder
### Title: Interpolate derivatives
### Aliases: inder inder.numeric inder.matrix inder.data.frame
###   inder,numeric,numeric-method inder,matrix,missing-method
###   inder,data.frame,missing-method
### Keywords: math derivative SDM FDM methods

### ** Examples

# First example
# Derive sinus
x <- 1:100/10
y <- sin(x)
ders <- inder(x, y)
plot(x, y, type = "l")
lines(ders[, "x"], ders[, "d1y"], col = "red")
lines(ders[, "x"], ders[, "d2y"], col = "green")
legend("topright", c("f(x)", "f'(x)", "f''(x)"), lty = 1, col = c("black", 
	"red", "green"))

# Second example
# Determine the approximate second derivative maximum
# for a qPCR experiment. SDM, 
isPCR <- AmpSim(cyc = 1:40)

res <- inder(isPCR)

plot(isPCR, xlab = "Cycle", ylab = "RFU", ylim = c(-0.15,1),
     main = "Approximate Second Derivative Maximum (SDM)", 
     type = "b", pch = 20)

  lines(res[, "x"], res[, "d1y"], col = "blue")
  lines(res[, "x"], res[, "d2y"], col = "red")
  summ <- summary(res, print = FALSE)
  abline(v = c(summ["SDM"], summ["SDm"], summ["SDC"]), col = c(3,4,5))
  text(summ["SDM"], 0.5, paste0("SDM ~ ", round(summ["SDM"], 2)), 
       cex = 1.5, col = 3)
  text(summ["SDC"], 0.7, paste0("SDC ~ ", round(summ["SDC"], 2)), 
       cex = 1.5, col = 5)
  text(summ["SDm"], 0.9, paste0("SDm ~ ", round(summ["SDm"], 2)), 
       cex = 1.5, col = 4)
  text(summ["FDM"] + 10, 0.65, paste("FDM ~ ", round(summ["FDM"], 2)), 
       cex = 1.5, col = 1)
       
  legend(1, 1, c("raw", "first derivative", "second derivative"), 
	 col = c(1,4,2), lty = c(2,1,1), cex = 1.2)



