## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
my_data  <- data.frame(id=c(1,2,3,4,5,6,7,8,9,10),
                       sex=c('M','F','M','F','F','M','F','M','F','M'), 
                       n=c(130,65,155,125,19,185,82,77,50,80), 
                       d=c(150,200,300,250,50,220,100,90,400,425)
                       )
knitr::kable(my_data)

## ----figdim, fig.height=5, fig.width=7, fig.align='center'---------------
library(funnelR)

my_limits   <- fundata(input=my_data, 
                      benchmark=0.50, 
                      alpha=0.80, 
                      alpha2=0.95, 
                      method='exact', 
                      step=1)

my_plot     <- funplot(input=my_data, 
                       fundata=my_limits)

my_plot

## ----figdim2, fig.height=5, fig.width=7, fig.align='center'--------------
my_limits2   <- fundata(input=my_data, 
                        benchmark=0.50, 
                        alpha=0.80, 
                        alpha2=0.95, 
                        method='approximate', 
                        step=0.5)

my_plot2     <- funplot(input=my_data, 
                        fundata=my_limits2)

my_plot2

## ----figdim3, fig.height=5, fig.width=7, fig.align='center'--------------
my_score <- funscore(input=my_data, 
                     benchmark=0.50, 
                     alpha=0.80, 
                     alpha2=0.95, 
                     method='approximate')

knitr::kable(my_score)

## ----figdim4, fig.height=5, fig.width=7, fig.align='center'--------------
my_plot3 <- funplot(input=my_score, 
                    fundata=my_limits2, 
                    byvar="score2")

my_plot3

## ----figdim5, fig.height=5, fig.width=7, fig.align='center'--------------
my_plot4 <- funplot(input=my_score, 
                    fundata=my_limits2, 
                    byvar="sex")

my_plot4

## ----figdim6, fig.height=5, fig.width=7, fig.align='center'--------------
library(ggplot2)

my_plot4_mod <- my_plot4 +
                labs(x="Physician practice size", y="Proportion (%) of satisfied patients") +
                geom_hline(yintercept=0.40, colour="darkred", linetype=6, size=1) +               
                theme_minimal() +
                scale_colour_manual(values=c("green","darkgreen")) + 
                geom_text(aes(label=id), colour="black", size=4, nudge_x=10) 
                

my_plot4_mod
 

