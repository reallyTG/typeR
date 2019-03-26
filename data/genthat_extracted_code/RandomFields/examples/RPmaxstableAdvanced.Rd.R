library(RandomFields)


### Name: Max-stable random fields, advanced 
### Title: Simulation examples of advanced Max-Stable Random Fields
### Aliases: maxstableAdvanced RPmaxstableAdvanced
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
## Don't show: ## Not run: 
##D RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##D ##                   RFoptions(seed=NA) to make them all random again
##D 
##D n <- 100
##D 
##D model <- RMexp(var=1.62 / 2) 
##D x <- seq(0, 5, 0.2)
##D y <- seq(0, 10, 0.2)
##D 
##D 
##D auswertung <- function(simu, model, threshold=2) {
##D   x <- as.vector(coordinates(simu))
##D   simu <- as.array(simu)
##D   below <- simu <= threshold
##D   freq <- rowMeans(below)
##D   meanfreq <- mean(freq)
##D   Print(freq, meanfreq, exp(-1/threshold)) ## univariate kontrolle
##D   both <- t(below) & below[1, ]
##D   ecf <-  2-log(colMeans(both)) / log(meanfreq)
##D   plot(x, ecf)
##D 
##D   ## alle 3 Linien ergeben das Gleiche:
##D   spC <- RFoptions()$general$spConform
##D   RFoptions(spConform = FALSE)
##D   lines(x, m1 <- RFcov(RMbrownresnick(model), x), col="yellow")
##D   lines(x, m2 <- RFcov(RMschlather(RMbr2eg(model)), x), col="red", lty=2) # OK
##D   m3 <- RFcov(RMbernoulli(RMbr2bg(model), centred=FALSE), x)
##D   lines(x, m3, col="blue", lty=3)
##D   RFoptions(spConform = spC)
##D 
##D   erfc <- function(x) 2 * pnorm(x, 0, sd=1/sqrt(2), lower=FALSE)
##D   lines(x, m4 <- erfc(0.45 * sqrt(1-exp(-x))), lty=4)
##D  
##D   ## theoretical curves correct?
##D   if (!all.equal(m1, m2) || !all.equal(m1, m3) || !all.equal(m1, m4))
##D     stop("calculation error")
##D 
##D   if ( (n <- ncol(simu)) >= 1000) {
##D     ## margins correct?
##D     mar.threshold <- 4 * 0.5 / sqrt(n)
##D     mmar.threshold <- 3 * 0.5 / sqrt(n)
##D     Print(abs(freq - exp(-1/threshold)), mar.threshold)
##D     if (abs(freq[sample(length(freq), 1)] - exp(-1/threshold)) > mar.threshold)
##D       stop("marginal distribution wrong? (single margin)")
##D     if (abs(meanfreq - exp(-1/threshold)) > mmar.threshold)
##D       stop("marginal distribution wrong? (mean margin)")
##D  
##D     ## extremal correlation function correct?
##D     meanthreshold <- 4 / sqrt(n)
##D     maxthreshold <- 2 * sqrt(nrow(simu)) / sqrt(n)
##D     Print(abs(ecf - m1), meanthreshold, maxthreshold)
##D     if (mean(abs(ecf - m2)) > meanthreshold)
##D       stop("ecf not correct? (mean deviation too large)")
##D     if (max(abs(ecf - m2)) > maxthreshold)
##D       stop("ecf not correct? (max deviation too large)")
##D   }
##D }
##D 
##D 
##D ## BR currently not programmed
##D \dontshow{\dontrun{ ## to to
##D ## Brown-Resnick
##D z <- RFsimulate(RPbrownresnick(model), y, y)
##D plot(z)
##D simu <- RFsimulate(RPbrownresnick(model), x, n=n,  max_gauss=5)
##D auswertung(simu, model)
##D }}
##D 
##D 
##D ## Extremal Gaussian
##D z <- RFsimulate(RPschlather(RMbr2eg(model)), y, y)
##D plot(z)
##D simu <- RFsimulate(RPschlather(RMbr2eg(model)), x,  n=n)
##D auswertung(simu, model)
##D 
##D ## Extremal Binary Gaussian
##D binary.model <- RPbernoulli(RMbr2bg(model))
##D z <- RFsimulate(RPschlather(binary.model), y, y)
##D plot(z)
##D simu <- RFsimulate(RPschlather(binary.model), x, n=n, max_gauss=5)
##D auswertung(simu, model)
##D 
##D 
##D \dontshow{\dontrun{ ## OK!
##D zaehler <- 0
##D repeat {
##D   Print(zaehler)
##D   zaehler <- zaehler + 1
##D   simu <- RFsimulate(RPschlather(RMbr2eg(model)), x, spConform=FALSE, n=n,
##D                     pch="")
##D   auswertung(simu, model)
##D }
##D }}
##D 
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)




