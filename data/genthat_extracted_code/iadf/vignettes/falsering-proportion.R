## ------------------------------------------------------------------------
library("iadf")
data("example_rwl")
data("example_iadf")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(example_rwl[20:30, 10:16])

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(example_iadf[20:30, 10:16])

## ---- results='hide'-----------------------------------------------------
rowMeans(example_iadf, na.rm = TRUE)

## ---- results='hide'-----------------------------------------------------
results_frp <- frp(example_iadf)

## ---- results='hide'-----------------------------------------------------
results_afrp <- afrp(example_iadf)

## ---- results='hide'-----------------------------------------------------
frq <- novak_freq(example_iadf)

## ---- fig.width=7--------------------------------------------------------
mdl <- novak_weibull(frq, 15)

## ---- results='hide'-----------------------------------------------------
results_novak <- novak_index(example_iadf, mdl)

## ------------------------------------------------------------------------
frq <- campelo_freq(example_iadf, example_rwl)

## ---- fig.width=7--------------------------------------------------------
mdl <- campelo_chapman(frq)

## ---- fig.width=7, eval=FALSE--------------------------------------------
#  st <- campelo_chapman_find_start(frq)
#  mdl <- campelo_chapman(frq, start = st)

## ---- results='hide'-----------------------------------------------------
results_campelo <- campelo_index(example_iadf, example_rwl, mdl)

## ---- fig.width=7, fig.height=5------------------------------------------
plot(NULL, xlim = range(as.numeric(rownames(example_iadf))), 
     ylim = c(-0.5, 2.5), xlab = '', ylab = '')
lines(results_frp, col = 'blue')
lines(results_afrp, col = 'green')
lines(results_novak, col = 'purple')
lines(results_campelo[ , c(1,3)], col = 'red')
legend('topright', col = c('blue', 'green', 'purple', 'red'), 
       legend = c('frp', 'afrp', 'Novak', 'Campelo'), bty = 'n', lty = 1)

