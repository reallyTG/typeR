library(RSEIS)


### Name: varsquig
### Title: Var-Squiggle plot
### Aliases: varsquig
### Keywords: hplot

### ** Examples


data(KH)

x <- KH$ex[KH$ex>95& KH$ex<125]
y <- KH$JSTR[[1]][KH$ex>95& KH$ex<125]


plot(x , y , type='l')


u <- par('usr')
L <- list(x=c(u[1], u[2]), y = c(u[3], u[4]))

plot(L$x, L$y, type='n')
 varsquig(x, y, L=L , FLIP=FALSE, filcol="blue", tracecol="blue", var=TRUE)
plot(L$x, L$y, type='n')
 varsquig(x, y, L=L , FLIP=FALSE, filcol="red", tracecol="blue",   var=FALSE)






