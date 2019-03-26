library(asbio)


### Name: anscombe
### Title: Anscombe's quartet
### Aliases: anscombe
### Keywords: datasets

### ** Examples

dev.new(height=3.5)
op <- par(mfrow=c(1,4),mar=c (0,0,2,3), oma = c(5, 4.2, 0, 0))
with(anscombe, plot(x1, y1, xlab = "", ylab = "", main = bquote(paste(italic(r),
" = ",.(round(cor(x1, y1),2)))))); abline(3,0.5) 
with(anscombe, plot(x2, y2, xlab = "", ylab = "",, main = bquote(paste(italic(r),
" = ",.(round(cor(x2, y2),2)))))); abline(3,0.5) 
with(anscombe, plot(x3, y3, xlab = "", ylab = "",, main = bquote(paste(italic(r),
" = ",.(round(cor(x3, y3),2)))))); abline(3,0.5) 
with(anscombe, plot(x4, y4, xlab = "", ylab = "",, main = bquote(paste(italic(r),
" = ",.(round(cor(x4, y4),2)))))); abline(3,0.5) 
mtext(expression(italic(y[1])),side=1, outer = TRUE, line = 3)
mtext(expression(italic(y[2])),side=2, outer = TRUE, line = 2.6)
mtext("(a)",side=3, at = -42, line = .5)
mtext("(b)",side=3, at = -26, line = .5)
mtext("(c)",side=3, at = -10.3, line = .5)
mtext("(d)",side=3, at = 5.5, line = .5)
par(op)



