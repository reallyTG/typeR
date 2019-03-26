## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
knitr::opts_chunk$set(fig.width=8, fig.height=5)
library(rpatrec)
library(np)
library(stats)

## ---- fig.show='hold'----------------------------------------------------
dji <- sample.pre(data[[3]])

plot(dji,type="l",main= "Dow Jones Industrials",xlab="Trading Days",ylab="Closing Price",col="blue")
abline(v=400, col="red")
abline(v=1250,col="red")

abline(v=1500, col="green")
abline(v=2100,col="green")

abline(v=2300, col="yellow")
abline(v=2800,col="yellow")

plot(dji[400:1250],type="l",main= "Inverse HS",xlab="Trading Days",ylab="Closing Price",col="blue")
plot(dji[1500:2100],type="l",main= "Dow Jones Industrials",xlab="Trading Days",ylab="Closing Price",col="blue")
plot(dji[2300:2800],type="l",main= "Dow Jones Industrials",xlab="Trading Days",ylab="Closing Price",col="blue")



## ---- fig.show='hold'----------------------------------------------------

a <- kernel(dji,30)
plot(a,type="l",main= "Dow Jones Industrials",xlab="Trading Days",ylab="Closing Price",col="blue")
abline(v=400, col="red")
abline(v=1250,col="red")

abline(v=1500, col="green")
abline(v=2100,col="green")

abline(v=2300, col="yellow")
abline(v=2800,col="yellow")


## ---- fig.show='hold'----------------------------------------------------

slicer(a,750,150,btpiq=FALSE,rtpiq=FALSE,dtpiq=FALSE)

## ---- fig.show='hold'----------------------------------------------------
plot(a[450:1200],type="l",main= "Dow Jones Industrials",xlab="Trading Days",ylab="Closing Price",col="blue")
plot(a[1350:2350],type="l",main= "Dow Jones Industrials",xlab="Trading Days",ylab="Closing Price",col="blue")
plot(a[2100:3300],type="l",main= "Different windows",xlab="Trading Days",ylab="Closing Price",col="blue")

abline(v=0)
abline(v=750)

abline(v=150, col="red")
abline(v=900, col="red")

abline(v=300, col="green")
abline(v=1050, col="green")

abline(v=450,col = "yellow")
abline(v=1200,col = "yellow")




## ---- fig.show='hold'----------------------------------------------------
interpret(a[2100:2850])
interpret(a[2250:3000])


