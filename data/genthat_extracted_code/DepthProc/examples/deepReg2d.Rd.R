library(DepthProc)


### Name: deepReg2d
### Title: Simple deepest regression method.
### Aliases: deepReg2d

### ** Examples


# EXAMPLE 1
data(pension)
plot(pension)
abline(
  lm(Reserves ~ Income, data = pension),
  lty = 3,
  lwd = 2) # lm
abline(
  deepReg2d(pension[, 1], pension[, 2]),
  lwd = 2) # deepreg2d

# EXAMPLE 2
data(under5.mort)
data(inf.mort)
data(maesles.imm)
data2011 <- na.omit(
    cbind(under5.mort[, 22], inf.mort[, 22],
    maesles.imm[, 22]))

x <- data2011[, 3]
y <- data2011[, 2]
plot(
  x, y,
  cex = 1.2,
  ylab = "infant mortality rate per 1000 live birth",
  xlab = "against masles immunized percentage",
  main = "Projection Depth Trimmed vs. LS regressions"
)
abline(lm(x ~ y), lwd = 2, col = "black") # lm
abline(
  deepReg2d (x, y),
  lwd = 2, col = "red"
) # trimmed reg

legend(
  "bottomleft",
  c("LS", "DeepReg"),
  fill = c("black", "red"),
  cex = 1.4,
  bty = "n"
)



