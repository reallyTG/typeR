## ----message = FALSE,  warning = FALSE-----------------------------------
library(neutralitytestr)

## ------------------------------------------------------------------------
head(VAFselection)

## ------------------------------------------------------------------------
s <- neutralitytest(VAFselection, fmin = 0.1, fmax = 0.25)

## ------------------------------------------------------------------------
summary(s)

## ------------------------------------------------------------------------
n <- neutralitytest(VAFneutral, read_depth = 100.0, cellularity = 0.8, rho = 0.0, ploidy = 2)
summary(n)

## ---- fig.show='hold',fig.width = 4, fig.height=3, warning = FALSE, fig.align='center'----
vaf_histogram(n)

## ---- fig.show='hold',fig.width = 4, fig.height=3, warning = FALSE, fig.align='center'----
lsq_plot(n)

## ---- fig.show='hold',fig.width = 4, fig.height=3, warning = FALSE, fig.align='center'----
normalized_plot(n)

## ---- warning = FALSE, fig.show='hold',fig.width = 10, fig.height=3, warning = FALSE, fig.align='center'----
gout <- plot_all(s)
gout

