library(Phxnlme)


### Name: phxplot
### Title: Plotting of Phoenix NLME output
### Aliases: phxplot

### ** Examples

## Residual plots for Model 1 
## Setting working directory
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1")
#phxplot(plot.type="residual.scatter",outpdf=FALSE)

## Residual plots for example 1
## Loading example 1 database
data(ex1phxd)
ex1=ex1phxd

phxplot(phxd=ex1,plot.type="residual.scatter",outpdf=FALSE)

## Observations versus prediction plots
phxplot(phxd=ex1,plot.type="obs.pred",outpdf=FALSE)

## Observations versus prediction plots on double log scale
phxplot(phxd=ex1,plot.type="obs.pred",scale="log",outpdf=FALSE) 

## Correlation of parameters
phxplot(phxd=ex1,plot.type="correlation",outpdf=FALSE) 

## Histograms of parameters
phxplot(phxd=ex1,plot.type="param",outpdf=FALSE) 

phxplot(phxd=ex1,plot.type="param.contcov",cont.cov="WT",outpdf=FALSE) 

## Individual fits on log y scale
phxplot(phxd=ex1,plot.type="ind",scale="log",outpdf=FALSE)

## Dynamic plot of individual fit; requires Rstudio
#phxplot(phxd=ex1,plot.type="ind.dynamic",sel.ID=39) 

## QQ plots of parameters
phxplot(phxd=ex1,plot.type="qq",outpdf=FALSE)

## Forest plots and boxplots of parameters versus categorical covariates for Model 1
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 1")
#phxplot(plot.type="forest",cat.cov=c("sex","age"),sparname=c("E0","EMAX")) 
#phxplot(plot.type="param.catcov",cat.cov=c("sex","dose")) 



