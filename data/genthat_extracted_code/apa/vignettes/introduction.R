## ---- warning=FALSE, echo=FALSE------------------------------------------
library(apa)

## ------------------------------------------------------------------------
# Data from ?cor.test
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)

ct <- cor.test(x, y)
ct

## ------------------------------------------------------------------------
cor_apa(ct)

## ------------------------------------------------------------------------
cor_apa(ct, format = "rmarkdown")

## ------------------------------------------------------------------------
cor_apa(ct, format = "latex")

## ---- eval=FALSE---------------------------------------------------------
#  # Opens a temporary document in your word processor
#  cor_apa(ct, format = "docx")

## ---- fig.width=6, fig.height=5------------------------------------------
# Paste output in a plot using R's plotmath syntax
plot(x, y)
abline(lm(y ~ x))
text(55, 3.9, cor_apa(ct, format = "plotmath"))

