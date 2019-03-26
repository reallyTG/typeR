## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold', fig.width = 6, fig.cap = 'Time series of one-day ahead HRES Precipitation forecasts (crosses) and respective observations (solid line) over London.'----
  
library(PointFore)
library(ggplot2)
library(lubridate)

precipitation$Date <- as.Date(row.names(precipitation),format = "%d-%m-%Y")


ggplot(subset(precipitation, month(Date)< 7 & year(Date)==2013))+
  geom_line(aes(x=Date,y=Y))+
  geom_point(aes(x=Date,y=X), color = 'red', size = 2, shape=4)
  

## ---- fig.show='hold', fig.cap = 'Constant expectile analysis.'----------

instruments <- c("lag(lag(Y))","X")

res <- estimate.functional(iden.fct = expectiles, model = constant,
                           instruments = instruments,
                           Y = precipitation$Y, X=precipitation$X)
summary(res)
plot(res,hline = TRUE)

## ---- fig.show='hold', fig.cap = 'linear probit model.'------------------
probit0 <- function(stateVariable,theta) probit_linear(stateVariable, theta)*(stateVariable>0)

res <- estimate.functional(iden.fct =   expectiles ,
                           model = probit0,
                           theta0 = c(0,0),
                           instruments = instruments,
                           state = precipitation$X,
                           Y = precipitation$Y, X=precipitation$X)
summary(res)

## ---- fig.show='hold', fig.cap = 'Plot linear probit model.'-------------
plot(res,limits = c(0.001,15),hline = TRUE)+
  geom_point(data=data.frame(x=c(0,0),y=c(0,.395),shape=c(1,2)),
             aes(x=x,y=y,shape=as.factor(shape)),
             ,size=3,show.legend = FALSE)+
  scale_shape_manual(values=c(16,1))

