## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(ggplot2)
library(gridExtra)
library(emojifont)

## ----fig.width=7, fig.height=4-------------------------------------------
canvas <- ggplot(data=data.frame(x=1:10, y=1:10), aes(x=x, y=y))   +
          scale_y_continuous(limits=c(1,10), breaks=seq(1,10,0.5)) +
          scale_x_continuous(limits=c(1,10), breaks=seq(1,10,0.5)) +
          theme_linedraw()

canvas

## ----fig.width=7, fig.height=4-------------------------------------------
panel1 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#DEEBF7', colour = '#DEEBF7'))

panel1

## ------------------------------------------------------------------------
panel2 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#9ECAE1', colour = '#9ECAE1'))

panel3 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#3182BD', colour = '#3182BD'))

## ----fig.width=7, fig.height=4-------------------------------------------
grid.arrange(panel1,panel2,panel3, ncol=3)

## ----fig.width=7, fig.height=4-------------------------------------------
grid.arrange(panel1,panel2,panel3, nrow=3)

## ----fig.width=7, fig.height=4-------------------------------------------
panel1 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#DEEBF7', colour = '#DEEBF7')) +
          annotate("text", x=5.5, y=9,   label = "Finding 1",    size=15, fontface=2) +
          annotate("text", x=5.5, y=2.5, label = "Statistics 1", size=12, fontface=2) +
          annotate("text", x=5.5, y=1.5, label = "Units 1",      size=12, fontface=2)
  
panel1

## ----fig.width=7, fig.height=4-------------------------------------------
panel1 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#DEEBF7', colour = '#DEEBF7')) +
          geom_text(family='fontawesome-webfont', label=fontawesome('fa-user-md'), 
                    x=5.5, y=5.5, size=75)



## ----eval=FALSE----------------------------------------------------------
#  panel1 <- canvas +
#            theme_void() +
#            theme(panel.background = element_rect(fill = '#DEEBF7', colour = '#DEEBF7')) +
#            geom_text(family='fontawesome-webfont', label=fontawesome('fa-user-md'),
#                      x=5.5, y=5.5, size=75)
#  
#  X11()
#  
#  #panel1

## ----fig.width=7, fig.height=4-------------------------------------------
panel1 <- canvas + 
          theme(panel.background = element_rect(fill = '#DEEBF7', colour = '#DEEBF7')) +
          annotate("text", x=5.5, y=9,   label = "Finding 1",    size=15, fontface=2) +
          annotate("text", x=5.5, y=2.5, label = "Statistics 1", size=12, fontface=2) +
          annotate("text", x=5.5, y=1.5, label = "Units 1",      size=12, fontface=2)
  
panel1

## ----fig.width=7, fig.height=4-------------------------------------------
#Canvas
canvas <- ggplot(data=data.frame(x=1:10, y=1:10), aes(x=x, y=y))   +
          scale_y_continuous(limits=c(1,10), breaks=seq(1,10,0.5)) +
          scale_x_continuous(limits=c(1,10), breaks=seq(1,10,0.5)) +
          theme_linedraw()

#Create individual panels
panel1 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#DEEBF7', colour = '#DEEBF7')) +
          geom_text(family='fontawesome-webfont', label=fontawesome('fa-user-md'), 
                    x=5.5, y=5.5, size=75) +
          annotate("text", x=5.5, y=9,   label = "Finding 1",    size=13, fontface=2) +
          annotate("text", x=5.5, y=2.5, label = "Statistics 1", size=10, fontface=2) +
          annotate("text", x=5.5, y=1.5, label = "Units 1",      size=10, fontface=2) 

panel2 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#9ECAE1', colour = '#9ECAE1')) +
          geom_text(family='fontawesome-webfont', label=fontawesome('fa-ambulance'), 
                    x=5.5, y=5.5, size=75) +
          annotate("text", x=5.5, y=9,   label = "Finding 2",    size=13, fontface=2) +
          annotate("text", x=5.5, y=2.5, label = "Statistics 2", size=10, fontface=2) +
          annotate("text", x=5.5, y=1.5, label = "Units 2",      size=10, fontface=2)

panel3 <- canvas + 
          theme_void() + 
          theme(panel.background = element_rect(fill = '#3182BD', colour = '#3182BD')) +
          geom_text(family='fontawesome-webfont', label=fontawesome('fa-wheelchair'), 
                   x=5.5, y=5.5, size=75) +
          annotate("text", x=5.5, y=9,   label = "Finding 3",    size=13, fontface=2) +
          annotate("text", x=5.5, y=2.5, label = "Statistics 3", size=10, fontface=2) +
          annotate("text", x=5.5, y=1.5, label = "Units 3",      size=10, fontface=2) 

#Arrange individual panels 
#grid.arrange(panel1, panel2, panel3, ncol=3)

