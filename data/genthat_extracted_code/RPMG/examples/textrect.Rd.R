library(RPMG)


### Name: textrect
### Title: Text labels with border
### Aliases: textrect
### Keywords: misc

### ** Examples



thepos = c(0, seq(from=1, to=4.5, by=.5))
lab="the string"

x = 1:9
y = 1:9
plot(x,y, asp=1)
for(i in 1:length(thepos))
{
textrect(x[i], y[i], lab, col=i , border='green' ,
textcol="gold",  off=.06,  brd=.06 , pos=thepos[i], font=1, cex=.8 )
}


x = runif(10)
y = runif(10)
lab = floor( 1000*runif(10) )
i=sample(thepos, 10, replace = TRUE)
col = sample(rainbow(100) , 10, replace = TRUE)

plot(x,y, asp=1)
textrect(x, y, lab, pos=i , textcol="black", col=col)






