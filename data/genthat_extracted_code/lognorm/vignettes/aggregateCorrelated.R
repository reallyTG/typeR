## ----eval=FALSE, include=FALSE-------------------------------------------
#  # twDev::genVigs()
#  rmarkdown::render("aggregateCorrelated.Rmd","md_document")

## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra = 'style="display:block; margin: auto"'
    #, fig.align = "center"
    #, fig.width = 4.6, fig.height = 3.2
    , fig.width = 6, fig.height = 3.75 #goldener Schnitt 1.6
    , dev.args = list(pointsize = 10)
    , dev = c('png','pdf')
    )
knit_hooks$set(spar = function(before, options, envir) {
    if (before) {
        par( las = 1 )                   #also y axis labels horizontal
        par(mar = c(2.0,3.3,0,0) + 0.3 )  #margins
        par(tck = 0.02 )                          #axe-tick length inside plots             
        par(mgp = c(1.1,0.2,0) )  #positioning of axis title, axis labels, axis
     }
})
library(lognorm) 
if (!require(ggplot2) || !require(dplyr) || !require(tidyr) || !require(purrr) ||
    !require(mvtnorm)
    ) {
	print(paste("To generate this vignette, ggplot2, dplyr, tidyr, purr,"
	            ," and mvtnorm are required."))
	exit(0)
}
themeTw <- theme_bw(base_size = 10) + 
  theme(axis.title = element_text(size = 9))

## ------------------------------------------------------------------------
nObs <- 100; nRep <- 10000
#nObs <- 1000; nRep <- 100
xTrue <- rep(10, nObs)
sigmaStar <- rep(1.7, nObs) # multiplicative stddev of 1.2
theta <- getParmsLognormForExpval(xTrue, sigmaStar)
# generate observations with correlated errors
acf1 <- c(0.4,0.1)
corrM <- setMatrixOffDiagonals(
  diag(nrow = nObs), value = acf1, isSymmetric = TRUE)
xObsN <- exp(mvtnorm::rmvnorm(
  nRep, mean = theta[,1]
  , sigma = diag(theta[,2]) %*% corrM %*% diag(theta[,2])))

## ---- echo=FALSE, fig.height=2.04, fig.width=3.27------------------------
ds <- tibble(i = 1:nObs, xTrue, xObs = xObsN[1,], xErr =  xObs - xTrue)
summary(rowSums(xObsN))
ggplot( ds, aes(i, xObs)) +
  geom_line() +
  geom_hline(yintercept = xTrue[1]) +
  themeTw +   
  theme(axis.title.x = element_blank())

## ------------------------------------------------------------------------
c(1, acf1)

## ------------------------------------------------------------------------
(effAcf <- computeEffectiveAutoCorr(ds$xErr))
(nEff <- computeEffectiveNumObs(ds$xErr))

## ------------------------------------------------------------------------
#coefSum <- estimateSumLognormal( theta[,1], theta[,2], effAcf = effAcf )
coefSum <- estimateSumLognormal( theta[,1], theta[,2], effAcf = c(1,acf1) )
exp(coefSum["sigma"])

## ------------------------------------------------------------------------
(sumExp <- getLognormMoments( coefSum[1], coefSum[2])[1,"mean"])

## ---- echo=FALSE, fig.height=2.04, fig.width=3.27------------------------
dsPredSum <- data.frame(
  p = seq(0, 1, length.out = 100)[-c(1,0)] # percentiles
) %>%
  mutate( 
    q = qlnorm(p, coefSum["mu"], coefSum["sigma"] )  # quantiles
    ,density = dlnorm(q, coefSum["mu"], coefSum["sigma"])) # approximated density
# density plot of the random draws
ggplot(data.frame(y = rowSums(xObsN)), aes(y, color = "random draws")) + 
  geom_density() +
  # line plot of the lognorm density approximation
  geom_line(data = dsPredSum, aes(q, density, color = "computed")) +
  # expected value
  geom_vline(xintercept = sumExp) +
themeTw +
theme(legend.position = c(0.98,0.98), legend.justification = c(1,1)) +
theme(axis.title.x = element_blank()) +
theme(legend.title = element_blank())

