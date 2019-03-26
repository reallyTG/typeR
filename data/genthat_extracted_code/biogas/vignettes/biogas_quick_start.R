## ----include=FALSE, cache=FALSE------------------------------------------
library(knitr)
#opts_chunk$set(cache=FALSE,tidy=FALSE,highlight=FALSE)
opts_chunk$set(cache = FALSE, tidy = FALSE, fig.align = "center")
library(biogas)
  options(width=75)

## ------------------------------------------------------------------------
library(biogas)
  
data("vol")

dim(vol)

head(vol)

summary(vol)

## ------------------------------------------------------------------------
data("comp")

dim(comp)

head(comp)

summary(comp)

## ------------------------------------------------------------------------
data("setup")

setup

## ----cumBgargs-----------------------------------------------------------
  args(cumBg)

## ------------------------------------------------------------------------
cum.prod <- cumBg(vol, comp = comp, time.name = "days", temp = 35, pres = 1, 
		  extrap = TRUE)

## ------------------------------------------------------------------------
head(cum.prod)

dim(cum.prod)

## ----fig.width=6, fig.height=4, fig.align="center"-----------------------
library(ggplot2)

qplot(x = days, y = cvCH4, data = cum.prod, xlab = "Time (d)", 
      ylab = "Cumulative methane production (mL)", color = id, 
      geom = "line")

## ----<-------------------------------------------------------------------
data("s3voll")
data("s3compl")
data("s3volw")
data("s3compw")
data("s3lcombo")

## ------------------------------------------------------------------------
s3voll
s3compl

## ------------------------------------------------------------------------
s3volw
s3compw

## ------------------------------------------------------------------------
s3lcombo

## ------------------------------------------------------------------------
cpl <- cumBg(s3lcombo, comp = s3compl, temp = 25, pres = 1,
             id.name = 'id', time.name = 'time.d',
             dat.name = 'vol.ml', comp.name = 'xCH4',
             extrap = TRUE)

cpw <- cumBg(s3volw, comp = s3compw, temp = 25, pres = 1,
             time.name = 'time.d',
             data.struct = 'wide',
             dat.name = 'D', comp.name = 'D',
             extrap = TRUE)

cpc <- cumBg(s3lcombo, temp = 25, pres = 1,
             id.name = 'id', time.name = 'time.d',
             data.struct = 'longcombo',
             dat.name = 'vol.ml', comp.name = 'xCH4',
             extrap = TRUE)

## ------------------------------------------------------------------------
head(cpl)

head(cpw)

head(cpc)

## ----summBgargs----------------------------------------------------------
  args(summBg)

## ----cprod30-------------------------------------------------------------
summBg(cum.prod, setup = setup, time.name = "days", descrip.name = "descrip", 
       when = 30)

## ------------------------------------------------------------------------
BMP <- summBg(cum.prod, setup = setup, time.name = "days", inoc.name = "inoc", 
	      inoc.m.name = "minoc", norm.name = "mvs.sub", when = "1p3d")
BMP

## ------------------------------------------------------------------------
predBg("C6H10O5")

## ----cellbmpcomp---------------------------------------------------------
BMP

## ------------------------------------------------------------------------
predBg("C6H10O5", fs = 0.1)

## ------------------------------------------------------------------------
predBg(COD = c(A = 1.439, B = 1.561, cellu = 1.184))

## ------------------------------------------------------------------------
  BMP$mean/predBg(COD = c(A = 1.439, B = 1.561, cellu = 1.184))

