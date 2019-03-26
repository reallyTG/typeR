library(RSEIS)


### Name: colorwig
### Title: Plot a seimic trace colored in time
### Aliases: colorwig
### Keywords: misc

### ** Examples


data(KH)

x <- KH$ex[KH$ex>95& KH$ex<125]
y <- KH$JSTR[[1]][KH$ex>95& KH$ex<125]


colorwig(x , y , rainbow(100))







