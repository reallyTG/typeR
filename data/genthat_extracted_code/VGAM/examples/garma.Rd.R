library(VGAM)


### Name: garma
### Title: GARMA (Generalized Autoregressive Moving-Average) Models
### Aliases: garma
### Keywords: models regression

### ** Examples

gdata <- data.frame(interspike = c(68, 41, 82, 66, 101, 66, 57,  41,  27, 78,
59, 73,  6, 44,  72, 66, 59,  60,  39, 52,
50, 29, 30, 56,  76, 55, 73, 104, 104, 52,
25, 33, 20, 60,  47,  6, 47,  22,  35, 30,
29, 58, 24, 34,  36, 34,  6,  19,  28, 16,
36, 33, 12, 26,  36, 39, 24,  14,  28, 13,
 2, 30, 18, 17,  28,  9, 28,  20,  17, 12,
19, 18, 14, 23,  18, 22, 18,  19,  26, 27,
23, 24, 35, 22,  29, 28, 17,  30,  34, 17,
20, 49, 29, 35,  49, 25, 55,  42,  29, 16))  # See Zeger and Qaqish (1988)
gdata <- transform(gdata, spikenum = seq(interspike))
bvalue <- 0.1  # .Machine$double.xmin # Boundary value
fit <- vglm(interspike ~ 1, trace = TRUE, data = gdata,
            garma(loge(bvalue = bvalue),
                  p = 2, coefstart = c(4, 0.3, 0.4)))
summary(fit)
coef(fit, matrix = TRUE)
Coef(fit)  # A bug here
## Not run: 
##D  with(gdata, plot(interspike, ylim = c(0, 120), las = 1,
##D      xlab = "Spike Number", ylab = "Inter-Spike Time (ms)", col = "blue"))
##D with(gdata, lines(spikenum[-(1:fit@misc$plag)], fitted(fit), col = "orange"))
##D abline(h = mean(with(gdata, interspike)), lty = "dashed", col = "gray") 
## End(Not run)



