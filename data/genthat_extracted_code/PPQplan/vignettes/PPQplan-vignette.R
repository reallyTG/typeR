## ----warning=FALSE, eval=FALSE-------------------------------------------
#  install.packages("PPQplan")

## ------------------------------------------------------------------------
library(PPQplan)

## ------------------------------------------------------------------------
rl.pp(Llim=95, Ulim=105, mu=98, sigma=1)

## ------------------------------------------------------------------------
PPQ.pp(Llim=95, Ulim=105, mu=98, sigma=1, n=10, n.batch = 1, k = 2.373)

## ----fig.height = 6, fig.width = 8, fig.align = "center"-----------------
sigma <- seq(0.1, 4, 0.1)
 pp1 <- sapply(X=sigma, FUN =  PPQ.pp, mu=97, n=10, Llim=95, Ulim=105, k=2.373)
 pp2 <- sapply(X=sigma, FUN =  PPQ.pp, mu=98, n=10, Llim=95, Ulim=105, k=2.373)
 pp3 <- sapply(X=sigma, FUN =  PPQ.pp, mu=99, n=10, Llim=95, Ulim=105, k=2.373)
 pp4 <- sapply(X=sigma, FUN =  PPQ.pp, mu=100, n=10, Llim=95, Ulim=105, k=2.373)
 plot(sigma, pp1, xlab="Standard Deviation", main="LSL=95, USL=105, k=2.373, n=10",
 ylab="Probability of Passing", type="o", pch=1, col=1, lwd=1, ylim=c(0,1))
 lines(sigma, pp2, type="o", pch=2, col=2)
 lines(sigma, pp3, type="o", pch=3, col=3)
 lines(sigma, pp4, type="o", pch=4, col=4)
 legend("topright", legend=paste0(rep("mu=",4),c(97,98,99,100)), bg="white",
 col=c(1,2,3,4), pch=c(1,2,3,4), lty=1, cex=0.8)

 mu <- seq(95, 105, 0.1)
 pp5 <- sapply(X=mu, FUN =  PPQ.pp, sigma=0.5, n=10, Llim=95, Ulim=105, k=2.373)
 pp6 <- sapply(X=mu, FUN =  PPQ.pp, sigma=1, n=10, Llim=95, Ulim=105, k=2.373)
 pp7 <- sapply(X=mu, FUN =  PPQ.pp, sigma=1.5, n=10, Llim=95, Ulim=105, k=2.373)
 pp8 <- sapply(X=mu, FUN =  PPQ.pp, sigma=2, n=10, Llim=95, Ulim=105, k=2.373)
 pp9 <- sapply(X=mu, FUN =  PPQ.pp, sigma=2.5, n=10, Llim=95, Ulim=105, k=2.373)
 plot(mu, pp5, xlab="Mean Value", main="LSL=95, USL=105, k=2.373, n=10",
 ylab="Probability of Passing", type="o", pch=1, col=1, lwd=1, ylim=c(0,1))
 lines(mu, pp6, type="o", pch=2, col=2)
 lines(mu, pp7, type="o", pch=3, col=3)
 lines(mu, pp8, type="o", pch=4, col=4)
 lines(mu, pp9, type="o", pch=5, col=5)
 legend("topright", legend=paste0(rep("sigma=",5),seq(0.5,2.5,0.5)), bg="white",
 col=c(1,2,3,4,5), pch=c(1,2,3,4,5), lty=1, cex=0.8)


## ----fig.height = 6, fig.width = 8, fig.align = "center"-----------------
PPQ.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%LC", Llim=95, Ulim=105, mu=98, sigma=seq(0.1, 10, 0.1), n=10, k=2.373)

## ----fig.height = 6, fig.width = 8, fig.align = "center"-----------------
PPQ.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%LC", Llim=95, Ulim=105, mu=98, sigma=seq(0.1, 10, 0.1), n=10, k=2.373, add.reference=TRUE)

## ----fig.height = 6, fig.width = 8, fig.align = "center"-----------------
mu <- seq(95,105,0.05)
sigma <- seq(0.1,1.75,0.05)
PPQ.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma, k=2.373)
test <- data.frame(mu=c(97,98.3,102.5), sd=c(0.55, 1.5, 1.2))
PPQ.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma, k=2.373, test.point=test)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
 mu <- seq(95, 105, 0.05)
 sigma <- seq(0.1,1.75,0.05)
 PPQ.ggplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma, k=2.373, dynamic = FALSE)
 
 PPQ.ggplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma, k=2.373, test.point = test, dynamic = FALSE)
 

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
 PPQ.ggplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma, k=2.373, test.point = test, dynamic = TRUE)

## ------------------------------------------------------------------------
pi.pp(Llim=95, Ulim=105, mu=98, sigma=1, n=10, n.batch = 1, alpha=0.05)


## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
 pi.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%LC",
 mu=97, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

 pi.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%LC",
 mu=100, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

 pi.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%LC",
 mu=seq(95,105,0.1), sigma=1, Llim=95, Ulim=105, n=10, add.reference=TRUE)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
mu <- seq(95, 105, 0.05)
sigma <- seq(0.1,1.75,0.05)
pi.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma)

## ------------------------------------------------------------------------
ti.pp(Llim=95, Ulim=105, mu=98, sigma=1, n=10, n.batch = 1, alpha=0.05, side=2)

ti.pp(Llim = 100, Ulim = Inf, mu=102.5, sigma=2, alpha = 0.05, coverprob = 0.675, side=1)


## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
 ti.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
 mu=97, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

 ti.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
 mu=100, sigma=seq(0.1, 10, 0.1), Llim=95, Ulim=105, n=10, add.reference=TRUE)

 ti.occurve(attr.name = "Sterile Concentration Assay", attr.unit="%",
 mu=seq(95,105,0.1), sigma=1, Llim=95, Ulim=105, n=10, add.reference=TRUE)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=1mL", Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40, alpha = 0.05, coverprob = 0.675, side=1, NV=1)

ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=1mL", Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40, alpha = 0.05, coverprob = 0.78, side=1, NV=1)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=3mL", Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40, alpha = 0.05, coverprob = 0.97, side=1, NV=3)

ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=3mL", Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40, alpha = 0.05, coverprob = 0.992, side=1, NV=3)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=6mL", Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40, alpha = 0.05, coverprob = 0.95, side=1, NV=6)

ti.occurve(attr.name = "Extractable Volume", attr.unit = "% of NV=6mL", Llim = 100, Ulim = Inf, mu=102.5, sigma=seq(0.2, 6 ,0.05), n=40, alpha = 0.05, coverprob = 0.987, side=1, NV=6)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
mu <- seq(95, 105, 0.05)
sigma <- seq(0.1,2.5,0.05)
ti.ctplot(attr.name = "Sterile Concentration Assay", attr.unit = "%LC", Llim=95, Ulim=105, mu = mu, sigma = sigma)

## ----fig.height = 6, fig.width = 8, fig.align = "center", warning=FALSE----
ti.ctplot(attr.name = "Extractable Volume", attr.unit = "% of NV=1mL", Llim = 100, Ulim = Inf, mu=seq(100, 110, 0.5), sigma=seq(0.2, 15 ,0.5), n=40, alpha = 0.05, coverprob = 0.675, side=1)

