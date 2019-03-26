## ----setup, echo=FALSE---------------------------------------------------

knitr::opts_chunk$set(fig.width = 6,
                      fig.height = 4,
                      fig.align='center',
                      dev = "png")


## ----echo=FALSE, message=FALSE-------------------------------------------
library(ggmosaic)
library(gridExtra)
library(grid)
data(fly)

grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {
  
  plots <- list(...)
  position <- match.arg(position)
  g <- ggplotGrob(plots[[1]] + theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x + theme(legend.position="none"))
  gl <- c(gl, ncol = ncol, nrow = nrow)
  
  combined <- switch(position,
                     "bottom" = arrangeGrob(do.call(arrangeGrob, gl),
                                            legend,
                                            ncol = 1,
                                            heights = unit.c(unit(1, "npc") - lheight, lheight)),
                     "right" = arrangeGrob(do.call(arrangeGrob, gl),
                                           legend,
                                           ncol = 2,
                                           widths = unit.c(unit(1, "npc") - lwidth, lwidth)))
  grid.newpage()
  grid.draw(combined)
  
}

## ----formula-1b, message=FALSE, fig.align='center'-----------------------
 ggplot(data = fly) +
   geom_mosaic(aes(x = product(RudeToRecline), fill=RudeToRecline), na.rm=TRUE) +
   labs(x="Is it rude recline? ", title='f(RudeToRecline)') 

## ----formula-2b, message=FALSE, fig.align='center'-----------------------

ggplot(data = fly) +
   geom_mosaic(aes(x = product(DoYouRecline, RudeToRecline), fill=DoYouRecline), na.rm=TRUE) + 
  labs(x = "Is it rude recline? ", title='f(DoYouRecline | RudeToRecline) f(RudeToRecline)')


## ----formula-4b, message=FALSE, fig.align='center'-----------------------
ggplot(data = fly) +
   geom_mosaic(aes(x = product(DoYouRecline, RudeToRecline), fill=DoYouRecline, conds=product(Gender)), na.rm=TRUE, divider=mosaic("v")) +  labs(x = "Is it rude recline? ", title='f(DoYouRecline, RudeToRecline| Gender)')


## ----formula-5b, message=FALSE, fig.align='center'-----------------------
ggplot(data = fly) +
   geom_mosaic(aes(x = product(DoYouRecline, RudeToRecline), fill=DoYouRecline), na.rm=TRUE) +  labs(x = "Is it rude recline? ", title='f(DoYouRecline, RudeToRecline| Gender)') + facet_grid(Gender~.)


## ----order-b, message=FALSE, fig.align='center'--------------------------

order1 <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(DoYouRecline, RudeToRecline), fill=DoYouRecline), na.rm=TRUE) +  labs(x = "Is it rude recline? ", title='f(DoYouRecline | RudeToRecline) f(RudeToRecline)') + theme(plot.title = element_text(size = rel(1)))

order2<- ggplot(data = fly) +
   geom_mosaic(aes(x = product(RudeToRecline, DoYouRecline), fill=DoYouRecline), na.rm=TRUE) + labs(x = "" , y = "Is it rude recline? ", title='f(DoYouRecline | RudeToRecline) f(RudeToRecline)') + coord_flip() + theme(plot.title = element_text(size = rel(1)))


## ----order-3, message=FALSE, fig.width = 8, fig.height = 4, fig.align='center'----

grid_arrange_shared_legend(order1, order2, ncol = 2, nrow = 1, position = "right")



## ----partitions, message=FALSE, fig.width = 7, fig.height = 3.5----------

hbar <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq), fill=FlightFreq), divider="hbar", na.rm=TRUE) + labs(x=" ", title='divider = "hbar"') 


hspine <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq), fill=FlightFreq),  divider="hspine", na.rm=TRUE) + labs(x=" ", title='divider = "hspine"') 


vbar <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq), fill=FlightFreq), divider="vbar", na.rm=TRUE) + labs(y=" ", x="", title='divider = "vbar"') 
 
vspine <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq), fill=FlightFreq), divider="vspine", na.rm=TRUE) + labs(y=" ", x="", title='divider = "vspine"') 


## ----plot, message=FALSE, fig.width = 8, fig.height = 4.5, fig.align='center', eval = FALSE----
#  
#  grid_arrange_shared_legend(hbar, hspine, vbar, vspine, ncol = 2, nrow = 2, position = "right")
#  

## ----mosaic-a, message=FALSE, fig.width = 7, fig.height = 3.5------------

h_mosaic <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=mosaic("h")) +
  theme(axis.text.x=element_blank(), legend.position="none") + 
  labs(x=" ", title='divider= mosaic()')

v_mosaic <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=mosaic("v")) +
  theme(axis.text.x=element_blank()) + 
  labs(x=" ", title='divider= mosaic("v")')


doubledecker <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=ddecker()) +
  theme(axis.text.x=element_blank()) +
  labs(x=" ", title='divider= ddecker()')


## ----mosaic-3, message=FALSE, fig.width = 8, fig.height = 4.5, fig.align='center', eval = FALSE----
#  
#  grid_arrange_shared_legend(h_mosaic, v_mosaic, doubledecker, ncol = 3, nrow = 1, position = "right")
#  

## ----mosaic-d, message=FALSE, fig.width = 7, fig.height = 3.5------------

mosaic4 <-  ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=c("vspine", "vspine", "hbar")) +
  theme(axis.text.x=element_blank()) +
  labs(x=" ", title='divider= c("vspine", "vspine", "hbar")') 

mosaic5 <-  ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=c("hbar", "vspine", "hbar")) +
  theme(axis.text.x=element_blank()) +
  labs(x=" ", title='divider= c("hbar", "vspine", "hbar")')

mosaic6 <-  ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=c("hspine", "hspine", "hspine")) +
  theme(axis.text.x=element_blank()) +
  labs(x=" ", title='divider= c("hspine", "hspine", "hspine")')

mosaic7 <-  ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Gender, Region), fill=FlightFreq), na.rm=T, divider=c("vspine", "vspine", "vspine")) +
  theme(axis.text.x=element_blank()) +
  labs(x=" ", title='divider= c("vspine", "vspine", "vspine")')


## ----mosaic-6, message=FALSE, fig.width = 8, fig.height = 4.5, fig.align='center', eval = FALSE----
#  
#  grid_arrange_shared_legend(mosaic4, mosaic5, mosaic6, mosaic7, ncol = 2, nrow = 2, position="right")
#  

## ----offset-b, message=FALSE---------------------------------------------

offset1 <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Region), fill=FlightFreq), na.rm=TRUE) + labs(x="Region", y=" ",  title=" offset = 0.01") 

offset0 <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Region), fill=FlightFreq), na.rm=TRUE, offset = 0) + labs(x="Region", y=" ",  title=" offset = 0")

offset2 <- ggplot(data = fly) +
   geom_mosaic(aes(x = product(FlightFreq, Region), fill=FlightFreq), na.rm=TRUE, offset = 0.02) + labs(x="Region", y=" ",  title=" offset = 0.02")


## ----offset-plot, message=FALSE, fig.width = 8, fig.height = 4, fig.align='center', eval = FALSE----
#  
#  grid_arrange_shared_legend(offset0, offset1, offset2, nrow = 1, ncol =3, position="right")
#  

## ----plotly, message=FALSE, echo=TRUE, eval=FALSE------------------------
#  
#  
#  gg <-ggplot(data = fly) +
#     geom_mosaic(aes(x = product(DoYouRecline, RudeToRecline), fill=DoYouRecline), na.rm=TRUE) + labs(x = "Is it rude recline? ", title='f(DoYouRecline | RudeToRecline) f(RudeToRecline)')

## ----plotly-3, message=FALSE, echo=TRUE, eval = FALSE--------------------
#  # just for now commented out
#  # ggplotly(gg)
#  

