## ----eval=FALSE, include=FALSE-------------------------------------------
#  # twDev::genVigs()
#  rmarkdown::render("lognormalSum.Rmd","md_document")

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
if (!require(ggplot2) || !require(dplyr) || !require(tidyr) || !require(purrr)) {
	print("To generate this vignette, ggplo2, dplyr, tidyr, and purrr are required.")
	exit(0)
}
themeTw <- theme_bw(base_size = 10) + 
  theme(axis.title = element_text(size = 9))

## ------------------------------------------------------------------------
# generate nSample values of two lognormal random variables
mu1 = log(110)
mu2 = log(100)
sigma1 = 0.25
sigma2 = 0.15
(coefSum <- estimateSumLognormal( c(mu1,mu2), c(sigma1,sigma2) ))

## ---- echo=FALSE, fig.height=2.04, fig.width=3.27------------------------
nSample = 2000
ds <- data.frame(
  x1 = rlnorm(nSample, mu1, sigma1)
  , x2 = rlnorm(nSample, mu2, sigma2)
) %>%  mutate(
  y = x1 + x2
)
dsw <- gather(ds, "var", "value", x1, x2, y)
p1 <- ggplot(dsw, aes(value, color = var)) + geom_density(linetype = "dotted")
#
p <- seq(0,1,length.out = 100)[-c(1,100)]
dsPredY <- data.frame(
  var = "y", q = qlnorm(p, coefSum["mu"], coefSum["sigma"] )
) %>%
  mutate( d = dlnorm(q, coefSum["mu"], coefSum["sigma"]))
p1 + geom_line(data = dsPredY, aes(q, d)) +
themeTw +
theme(legend.position = c(0.98,0.98), legend.justification = c(1,1)) +
theme(axis.title.x = element_blank())

