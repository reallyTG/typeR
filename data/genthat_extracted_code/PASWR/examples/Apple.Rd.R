library(PASWR)


### Name: Apple
### Title: Apple Hardness
### Aliases: Apple
### Keywords: datasets

### ** Examples

# Figure 8.5 
attach(Apple)
par(pty = "s")
Altblue <- "#A9E2FF"
Adkblue <- "#0080FF"
fresh <- qqnorm(Fresh)
old <- qqnorm(Warehouse)
plot(fresh,type="n",ylab="Sample Quantiles",xlab="Theoretical Quantiles")
qqline(Fresh, col = Altblue)
qqline(Warehouse, col = Adkblue)
points(fresh, col = Altblue, pch = 16, cex = 1.2)
points(old, col = Adkblue, pch = 17)
legend(-1.75, 9.45, c("Fresh", "Warehouse"), col = c(Altblue, Adkblue),
text.col=c("black","black"),pch=c(16,17),lty=c(1,1),bg="gray95",cex=0.75)
title("Q-Q Normal Plots")
detach(Apple)
# Trellis approach
qqmath(~c(Fresh, Warehouse), type=c("p","r"), pch=c(16,17), 
cex = 1.2, col=c("#A9E2FF", "#0080FF"),
groups=rep(c("Fresh", "Warehouse"), c(length(Fresh), length(Warehouse))), 
data=Apple, ylab="Sample Quantiles", xlab="Theoretical Quantiles")



