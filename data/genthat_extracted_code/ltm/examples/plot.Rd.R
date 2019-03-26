library(ltm)


### Name: plot IRT
### Title: Plot method for fitted IRT models
### Aliases: plot.gpcm plot.grm plot.ltm plot.rasch plot.tpm
### Keywords: methods

### ** Examples


# Examples for plot.grm()

fit <- grm(Science[c(1,3,4,7)])

## Item Response Category Characteristic Curves for 
## the Science data
op <- par(mfrow = c(2, 2))
plot(fit, lwd = 2, legend = TRUE, ncol = 2)
# re-set par()
par(op)

## Item Characteristic Curves for the 2nd category,
## and items 1 and 3
plot(fit, category = 2, items = c(1, 3), lwd = 2, legend = TRUE, cx = "right")

## Item Information Curves for the Science data;
plot(fit, type = "IIC", legend = TRUE, cx = "topright", lwd = 2, cex = 1.4)

## Test Information Function for the Science data;
plot(fit, type = "IIC", items = 0, lwd = 2)


###################################################


# Examples for plot.ltm()

## Item Characteristic Curves for the two-parameter logistic
## model; plot only items 1, 2, 4 and 6; take the range of the
## latent ability to be (-2.5, 2.5):
fit <- ltm(WIRS ~ z1)
plot(fit, items = c(1, 2, 4, 6), zrange = c(-2.5, 2.5), lwd = 3, cex = 1.4)

## Test Information Function under the two-parameter logistic
## model for the Lsat data
fit <- ltm(LSAT ~ z1)
plot(fit, type = "IIC", items = 0, lwd = 2, cex.lab = 1.2, cex.main = 1.3)
info <- information(fit, c(-3, 0))
text(x = 2, y = 0.5, labels = paste("Total Information:", round(info$InfoTotal, 3), 
    "\n\nInformation in (-3, 0):", round(info$InfoRange, 3), 
    paste("(", round(100 * info$PropRange, 2), "%)", sep = "")), cex = 1.2)

## Item Characteristic Surfaces for the interaction model:
fit <- ltm(WIRS ~ z1 * z2)
plot(fit, ticktype = "detailed", theta = 30, phi = 30, expand = 0.5, d = 2, 
     cex = 0.7, col = "lightblue")

###################################################


# Examples for plot.rasch()

## Item Characteristic Curves for the WIRS data;
## plot only items 1, 3 and 5:
fit <- rasch(WIRS)
plot(fit, items = c(1, 3, 5), lwd = 3, cex = 1.4)
abline(v = -4:4, h = seq(0, 1, 0.2), col = "lightgray", lty = "dotted")

fit <- rasch(LSAT)

## Item Characteristic Curves for the LSAT data;
## plot all items plus a legend and use only black:
plot(fit, legend = TRUE, cx = "right", lwd = 3, cex = 1.4, 
     cex.lab = 1.6, cex.main = 2, col = 1, lty = c(1, 1, 1, 2, 2),
     pch = c(16, 15, 17, 0, 1))
abline(v = -4:4, h = seq(0, 1, 0.2), col = "lightgray", lty = "dotted")

## Item Information Curves, for the first 3 items; include a legend
plot(fit, type = "IIC", items = 1:3, legend = TRUE, lwd = 2, cx = "topright")

## Test Information Function
plot(fit, type = "IIC", items = 0, lwd = 2, cex.lab = 1.1, 
     sub = paste("Call: ", deparse(fit$call)))

## Total information in (-2, 0) based on all the items
info.Tot <- information(fit, c(-2, 0))$InfoRange
## Information in (-2, 0) based on items 2 and 4
info.24 <- information(fit, c(-2, 0), items = c(2, 4))$InfoRange
text(x = 2, y = 0.5, labels = paste("Total Information in (-2, 0):", 
    round(info.Tot, 3), 
    "\n\nInformation in (-2, 0) based on\n Items 2 and 4:", round(info.24, 3), 
    paste("(", round(100 * info.24 / info.Tot, 2), "%)", sep = "")), 
    cex = 1.2)

## The Standard Error of Measurement can be plotted by
vals <- plot(fit, type = "IIC", items = 0, plot = FALSE)
plot(vals[, "z"], 1 / sqrt(vals[, "info"]), type = "l", lwd = 2,
     xlab = "Ability", ylab = "Standard Error", 
     main = "Standard Error of Measurement")

###################################################


# Examples for plot.tpm()

## Compare the Item Characteristic Curves for the LSAT data,
## under the constraint Rasch model, the unconstraint Rasch model,
## and the three parameter model assuming equal discrimination
## across items
par(mfrow = c(2, 2))
pl1 <- plot(rasch(LSAT, constr = cbind(length(LSAT) + 1, 1)))
text(2, 0.35, "Rasch model\nDiscrimination = 1")
pl2 <- plot(rasch(LSAT))
text(2, 0.35, "Rasch model")
pl3 <- plot(tpm(LSAT, type = "rasch", max.guessing = 1))
text(2, 0.35, "Rasch model\nwith Guessing parameter")

## Compare the Item Characteristic Curves for Item 4
## (you have to run the above first)
plot(range(pl1[, "z"]), c(0, 1), type = "n", xlab = "Ability", 
     ylab = "Probability", main = "Item Characteristic Curves - Item 4")
lines(pl1[, c("z", "Item 4")], lwd = 2, col = "black")
lines(pl2[, c("z", "Item 4")], lwd = 2, col = "red")
lines(pl3[, c("z", "Item 4")], lwd = 2, col = "blue")
legend("right", c("Rasch model Discrimination = 1", "Rasch model", 
       "Rasch model with\nGuessing parameter"), lwd = 2, col = c("black", 
       "red", "blue"), bty = "n")




