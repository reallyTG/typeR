## ----eval=FALSE, include=FALSE-------------------------------------------
#  # twDev::genVigs()
#  rmarkdown::render("lognorm.Rmd","md_document")

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
if (!require(ggplot2) || !require(dplyr) || !require(purrr)) {
	print("To generate this vignette, ggplo2, dplyr, and purrr are required.")
	exit(0)
}
themeTw <- theme_bw(base_size = 10) + 
  theme(axis.title = element_text(size = 9))

## ----lognormalDensities, echo=FALSE, fig.height=2.04, fig.width=3.27-----
x <- seq(0,2.5,length.out = 200)
mu <- log(1)
sigmaStar0 <- c(1.2,1.5,2,5)
ans <- map_df(sigmaStar0, function(sigmaStarI){
  data.frame(
    sigmaStar = sigmaStarI, x = x
    , density = dlnorm(x, mu, log(sigmaStarI))
    , cumDensity = plnorm(x, mu, log(sigmaStarI))
    )
}) %>% mutate(sigmaStar = factor(sigmaStar, levels = rev(as.character(sigmaStar0)) ))
coefNorm <- getLognormMoments(mu, log(sigmaStar0[1]))
ansNormal <- data.frame(
  sigmaStar = "normal", x = x
  , density = dnorm(x, coefNorm[1], sqrt(coefNorm[2]))
  , cumDensity = pnorm(x, coefNorm[1], sqrt(coefNorm[2]))
  )
#ansNormal %>%  ggplot(aes(x,density)) + geom_line()
ans %>% ggplot(aes(x,density, linetype = sigmaStar, color = sigmaStar)) + 
  geom_area(
    data = ansNormal, aes(linetype = NA, color = NA), fill = "blue"
    , alpha = 0.1, show.legend = FALSE) +
  geom_line() +
  scale_linetype_discrete(name = bquote(sigma^"*"), breaks = rev(sigmaStar0)) +
  scale_color_discrete(name = bquote(sigma^"*"), breaks = rev(sigmaStar0)) +
  themeTw +
  theme(legend.position = c(0.98,0.98), legend.justification = c(1,1)) +
  theme(axis.title.x = element_blank())

## ----lognormalCumDensities, echo=FALSE, fig.height=2.04, fig.width=3.27----
ans %>% ggplot(aes(x,cumDensity, linetype = sigmaStar, color = sigmaStar)) + 
  geom_line(
    data = ansNormal, color = "blue", linetype = "dotted", show.legend = FALSE) +
  geom_line() +
  scale_linetype_discrete(name = bquote(sigma^"*"), breaks = rev(sigmaStar0)) +
  scale_color_discrete(name = bquote(sigma^"*"), breaks = rev(sigmaStar0)) +
  themeTw +
  theme(legend.position = c(0.98,0.98), legend.justification = c(1,1)) +
  theme(axis.title.x = element_blank())

## ----momentsLogitnorm----------------------------------------------------
getLognormMode(mu = 0.6,sigma = 0.5)
getLognormMedian(mu = 0.6,sigma = 0.5)
(theta <- getLognormMoments(mu = 0.6,sigma = 0.5))

## ----twCoefLogitnormMLE--------------------------------------------------
moments <- cbind(mean = c(1,1), var = c(0.2, 0.3)^2 )
(theta <- getParmsLognormForMoments( moments[,1], moments[,2]))

## ----plotFromMoments, echo=FALSE, fig.height=2.04, fig.width=3.27--------
ans <- map_df(1:nrow(moments), function(i){
  tibble(
    sd = sqrt(moments[i,2]), x = x
    , density = dlnorm(x, theta[i,1], theta[i,2])
    )
}) %>% mutate(sd = factor(sd)) 
ans %>% ggplot(aes(x,density, linetype = sd, color = sd)) + 
  geom_vline(xintercept = 1, color = "grey10", size = 0.2) +
  geom_line() +
  themeTw +
  theme(legend.position = c(0.98,0.98), legend.justification = c(1,1)) +
  theme(axis.title.x = element_blank())


