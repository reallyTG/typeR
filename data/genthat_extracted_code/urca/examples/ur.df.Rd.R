library(urca)


### Name: ur.df
### Title: Augmented-Dickey-Fuller Unit Root Test
### Aliases: ur.df
### Keywords: regression

### ** Examples

data(Raotbl3)
attach(Raotbl3)
lc.df <- ur.df(y=lc, lags=3, type='trend')
summary(lc.df)



