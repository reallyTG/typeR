## ------------------------------------------------------------------------
library(sigmoid)
sigmoid(3)

## ------------------------------------------------------------------------
sigmoid(-5:5)
sigmoid( matrix(-3:5,nrow=3) ) # etc.

## ------------------------------------------------------------------------
sigmoid( -5:5, method='Gompertz' )

## ------------------------------------------------------------------------
Gompertz(-1:-5)

## ------------------------------------------------------------------------
sigmoid( -5:5, method='ReLU')

## ------------------------------------------------------------------------
sigmoid( -5:5, method="leakyReLU")

## ----sigmoid-shape-------------------------------------------------------
library(ggplot2)

input = -5:5

df = data.frame(input, logistic(input), Gompertz(input))

ggplot(df, aes(input, logistic(input))) + geom_line() +
  geom_line(aes(input,Gompertz(input)), colour='red')

## ------------------------------------------------------------------------
sigmoid( sigmoid(-5:5), inverse=TRUE )

## ------------------------------------------------------------------------
sigmoid( sigmoid(-5:5, method='Gompertz'), method='Gompertz', inverse=TRUE )

## ---- results='hold'-----------------------------------------------------
sigmoid( -3:5 )
sigmoid( -3:5, SoftMax = TRUE )

## ---- message=FALSE------------------------------------------------------
x = seq(1,5, by=0.05)
qplot(sigmoid(x))
qplot( sigmoid(x, k=sd(x), x0=mean(x) ) )

