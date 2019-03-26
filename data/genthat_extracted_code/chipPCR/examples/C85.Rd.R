library(chipPCR)


### Name: C85
### Title: Helicase Dependent Amplification of Vimentin using the VideoScan
###   Platform
### Aliases: C85
### Keywords: datasets HDA EvaGreen HCU VIM VideoScan

### ** Examples

data(C85)
# First example
plot(NA, NA, xlim = c(0,85), ylim = c(0,1), xlab = "Time [min]", 
      ylab = "Fluorescence", main = "HDA amplification")
points(C85[, 2]/60, C85[, 3], type = "b", col = 1, pch = 20)
points(C85[, 4]/60, C85[, 5], type = "b", col = 2, pch = 20)
points(C85[, 6]/60, C85[, 7], type = "b", col = 3, pch = 20)
legend(40, 0.5, c("D1, 1x", "D2, 1:10", "D3, 1:100"), col = c(1:3), 
	pch = rep(20,3))

# Second example
plot(NA, NA, xlim = c(0,30), ylim = c(0,0.8), xlab = "Time [min]", 
      ylab = "Fluorescence", main = "HDA amplification")
points(C85[, 2]/60, C85[, 3], type = "b", col = 1, pch = 20)
points(C85[, 2]/60, smoother(C85[, 2]/60, C85[, 3], 
      method = list("savgol")), type = "b", col = 2, pch = 20)
points(C85[, 2]/60, smoother(C85[, 2]/60, C85[, 3], 
      method = list("smooth")), type = "b", col = 3, pch = 20)
points(C85[, 2]/60, smoother(C85[, 2]/60, C85[, 3], 
      method = list("mova")), type = "b", col = 4, pch = 20)

legend(1, 0.8, c("D1, raw", "D1, savgol", "D1, smooth", "D1, mova"), 
	col = c(1:4), pch = rep(20,4))

# Third example
# Comparison of Lowess, Moving average and splines to smooth amplification 
# curve data of
# a HDA using the VideoScan HCU for amplification and monitoring.

xrange <- 2:2400
plot(NA, NA, xlim = c(0,85), ylim = c(0.4, 0.8), xlab = "Time [min]", 
      ylab = "RFI", main = "Raw data")
points(C85[, 2]/60, C85[, 3], type = "b", col = 1, pch = 20)
points(C85[, 4]/60, C85[, 5], type = "b", col = 2, pch = 20)
points(C85[, 6]/60, C85[, 7], type = "b", col = 3, pch = 20)
legend("topleft", c("D1, 1x", "D2, 1:10", "D3, 1:100"), col = c(1:3), 
	pch = rep(20,3))

mtext("A", cex = 2, side = 3, adj = 0, font = 2)

plot(NA, NA, xlim = c(0,40), ylim = c(-0.05, 0.3), xlab = "Time [min]", 
      ylab = "RFI", main = "Moving average")
movaww <- seq(1,17,4)
for (i in 1:length(movaww)) {
  for (j in c(2,4,6)) {
    tmp <- data.frame(na.omit(C85[xrange, j])/60, na.omit(C85[xrange, j + 1]))
    tmp.out <- smoother(tmp[, 1], tmp[, 2], method = list(mova = list(movaww = movaww[i])), 
			bg.outliers = TRUE)
    lines(data.frame(tmp[, 1], tmp.out), type = "l", pch = 20, cex = 0.5, 
	  col = i)
    }
}
mtext("B", cex = 2, side = 3, adj = 0, font = 2)
legend("topleft", c("D1, 1x", "D2, 1:10", "D3, 1:100"), col = c(1:3), 
	pch = rep(20,3))
legend("bottomright", 6, paste("movaww : ", movaww), pch = 20, lwd = 2, 
	col = 1:length(movaww))
    
plot(NA, NA, xlim = c(0,40), ylim = c(-0.05, 0.3), xlab = "Time [min]", 
      ylab = "RFI", main = "Cubic Spline")
df.fact <- seq(0.5,0.9,0.1)
for (i in 1:length(df.fact)) {
  for (j in c(2,4,6)) {
    tmp <- data.frame(na.omit(C85[xrange, j])/60, na.omit(C85[xrange, j + 1]))
    tmp.out <- smoother(tmp[, 1], tmp[, 2], 
		  method = list(smooth = list(df.fact = df.fact[i])), 
		  bg.outliers = TRUE)
    
    lines(data.frame(tmp[, 1], tmp.out), type = "l", pch = 20, 
    cex = 0.5, col = i)
    }
}
    
mtext("C", cex = 2, side = 3, adj = 0, font = 2)
legend("topleft", c("D1, 1x", "D2, 1:10", "D3, 1:100"), col = c(1:3), 
pch = rep(20,3))
legend("bottomright", paste("df.fact : ", df.fact), pch = 20, lwd = 2, 
col = 1:length(df.fact))
    
plot(NA, NA, xlim = c(0,40), ylim = c(-0.05, 0.3), xlab = "Time [min]", 
ylab = "RFI", main = "Lowess")
f <- seq(0.01,0.2,0.04)
for (i in 1:length(f)) {
  for (j in c(2,4,6)) {
    tmp <- data.frame(na.omit(C85[xrange, j])/60, na.omit(C85[xrange, j + 1]))
    tmp.out <- smoother(tmp[, 1], tmp[, 2], method = list(lowess = list(f = f[i])), 
		  bg.outliers = TRUE)
    
    lines(data.frame(tmp[, 1], tmp.out), type = "l", pch = 20, cex = 0.5, 
    col = i)
    }
    }
    
    mtext("D", cex = 2, side = 3, adj = 0, font = 2)
    legend("topleft", c("D1, 1x", "D2, 1:10", "D3, 1:100"), col = c(1:3), 
    pch = rep(20,3))
    legend("bottomright", paste("f : ", f), pch = 20, lwd = 2, col = 1:length(f))
	
plot(NA, NA, xlim = c(0,40), ylim = c(-0.05, 0.3), xlab = "Time [min]", 
ylab = "RFI", main = "Friedman's\n''super smoother''")
span <- seq(0.01,0.05,0.01)
for (i in 1:length(span)) {
  for (j in c(2,4,6)) {
    tmp <- data.frame(na.omit(C85[xrange, j])/60, na.omit(C85[xrange, j + 1]))
    tmp.out <- smoother(tmp[, 1], tmp[, 2], method = list(supsmu = list(span = span[i])), 
	  bg.outliers = TRUE)
    
    lines(data.frame(tmp[, 1], tmp.out), type = "l", pch = 20, cex = 0.5, 
col = i)
    }
    }
    
    mtext("E", cex = 2, side = 3, adj = 0, font = 2)
    legend("topleft", c("D1, 1x", "D2, 1:10", "D3, 1:100"), col = c(1:3), 
pch = rep(20,3))
    legend("bottomright", paste("span : ", span), pch = 20, lwd = 2, col = 1:length(span))
	  
plot(NA, NA, xlim = c(0,40), ylim = c(-0.05, 0.3), xlab = "Time [min]", 
ylab = "RFI", main = "Savitzky-Golay")

for (j in c(2,4,6)) {
  tmp <- data.frame(na.omit(C85[xrange, j])/60, na.omit(C85[xrange, j + 1]))
  tmp.out <- smoother(tmp[, 1], tmp[, 2], method = list("savgol"), 
	bg.outliers = TRUE)
  
  lines(data.frame(tmp[, 1], tmp.out), type = "l", pch = 20, cex = 0.5, 
col = 1)
  }
  
  mtext("F", cex = 2, side = 3, adj = 0, font = 2)
  legend("bottomright", paste("/ : ", NULL), pch = 20, lwd = 2, col = 1:length(span))



