## ------------------------------------------------------------------------

library(TrajDataMining)
library(ggplot2)
library(sp)
library(magrittr)
suppressMessages(library(rgdal))

## ----fig.height=4,fig.width=4,fig.align='center'-------------------------

  df <- data.frame(x=A1@sp@coords[,1],y=A1@sp@coords[,2])

  ggplot(df,aes(x=df$x,y=df$y))+geom_path(aes(group = 1), arrow = arrow(),color='blue')+ggtitle("elephant sea Trajectory")+xlab("X")+ ylab("Y")+theme_classic()
  

## ---- fig.height=4,fig.width=4,fig.align='center'------------------------

# get the maximum distance
 max <- max(A1@connections$distance)

 douglasp <- douglasPeucker(A1,max)
 
 df <- data.frame(x=douglasp@sp@coords[,1],y=douglasp@sp@coords[,2])
 ggplot(df,aes(x=df$x,y=df$y))+geom_path(aes(group = 1), arrow = arrow(),color='blue')+ggtitle("Method Douglas Peucker")+xlab("X")+ ylab("Y")+theme_classic()
 

## ---- fig.height=4,fig.width=4,fig.align='center'------------------------

# get the maximum distance
  sf <- speedFilter(A1,0.01)
  df <- data.frame(x=sf@sp@coords[,1],y=sf@sp@coords[,2])

 ggplot(df,aes(x=df$x,y=df$y))+geom_path(aes(group = 1), arrow = arrow(),color='blue')+ggtitle("Method Speed Filter")+xlab("X")+ ylab("Y")+theme_classic()

## ---- fig.height=6,fig.width=6,fig.align='center'------------------------
 
  data <- FALSE
  
  partner(A1,A2,110792,2277,0,data)

  


