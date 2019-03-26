## ----setup, include=FALSE,warning=F--------------------------------------
knitr::opts_chunk$set(echo = TRUE)
#knitr::opts_chunk$set(fig.width=8, fig.height=6)
library(rcrossref)
library(captioner)

## ----echo = F, eval = T--------------------------------------------------
fig_nums <- captioner(prefix = "Figure")
sat_cap <- fig_nums(name = "sat", caption = "Observed Verbal SAT Scores")
percent_cap <- fig_nums(name = "percent", caption = "Percent of eligible students taking the SAT")
fit_cap <- fig_nums(name = "fits", caption = "Posterior Medians for Verbal SAT")

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=58)----

library(rgdal)

system.path <- system.file("extdata", "us.shape48.shp", package = "ref.ICAR", mustWork = TRUE)
shp.layer <- gsub('.shp','',basename(system.path))
shp.path <- dirname(system.path)

us.shape48 <- readOGR(dsn = path.expand(shp.path), layer = shp.layer, verbose = FALSE)

## ----echo = T, eval = T, warning=F, message=F, tidy=TRUE, tidy.opts=list(width.cutoff=58)----

library(utils)

data.path <- system.file("extdata", "states-sats48.txt", package = "ref.ICAR", mustWork = TRUE)

sats48 <- read.table(data.path, header = T)
us.shape48$verbal <- sats48$VERBAL
us.shape48$percent <- sats48$PERCENT

## ----echo = T, eval = T,fig.cap=sat_cap, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60),fig.align="center",fig.pos="h",fig.width=7,fig.height=5.5----

library(RColorBrewer)
library(sp)

verbal.brk <- quantile(sats48$VERBAL,c(0,.2,.4,.6,0.8,1)) + c(-.1,0,0,0,0,.1)
verbal.color<-brewer.pal(5,"Greys")
spplot(us.shape48, "verbal", at = verbal.brk, col.regions = verbal.color,par.settings = list(panel.background=list(col="white")), main="Observed Verbal SAT Scores")

## ----echo = T, eval = T,fig.cap=percent_cap, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60),fig.align="center",fig.pos="h",fig.width=7,fig.height=5.5----

percent.brk <- quantile(sats48$PERCENT,c(0,.2,.4,.6,0.8,1)) + c(-.1,0,0,0,0,.1)
percent.color <- brewer.pal(5, "Greys")
spplot(us.shape48, "percent", at = percent.brk, col.regions = percent.color,par.settings = list(panel.background=list(col="white")),main="Percent Taking SAT")

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60)----

library(ref.ICAR)

shp.data <- shape.H(system.path)
H <- shp.data$H

class(shp.data$map)
length(shp.data$map)

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60)----

Y <- sats48$VERBAL
x <- sats48$PERCENT
X <- cbind(1,x)

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60)----
set.seed(3456)

ref.SAT <- ref.MCMC(y=Y,X=X,H=H,iters=15000,burnin=5000,verbose=FALSE)

names(ref.SAT)

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60),fig.width=7,fig.height=5----
par(mfrow=c(2,2))
ref.plot(ref.SAT$MCMCchain,X,burnin=5000,num.reg=length(Y))

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60)----

summary.params <- ref.summary(MCMCchain=ref.SAT$MCMCchain,tauc.MCMC=ref.SAT$tauc.MCMC,sigma2.MCMC=ref.SAT$sigma2.MCMC,beta.MCMC=ref.SAT$beta.MCMC,phi.MCMC=ref.SAT$phi.MCMC,accept.phi=ref.SAT$accept.phi,accept.sigma2=ref.SAT$accept.sigma2,accept.tauc=ref.SAT$accept.tauc,iters=15000,burnin=5000)

names(summary.params)
summary.params

## ----echo = T, eval = T,fig.cap=fit_cap, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60),fig.align="center",fig.pos="h",fig.width=7,fig.height=5.5----

summary.region <- reg.summary(ref.SAT$MCMCchain,X,Y,burnin=5000)

us.shape48$verbalfits <- summary.region$reg.medians
spplot(us.shape48, "verbalfits", at = verbal.brk, col.regions = verbal.color,main="Posterior Medians for Verbal SAT",par.settings = list(panel.background=list(col="white")))

## ----echo = T, eval = T, warning=F,message=F, tidy=TRUE, tidy.opts=list(width.cutoff=60),fig.width=7,fig.height=5----

### The SAT scores and percent of students are already arranged by state alphabetically
x.reg.names <- us.shape48$NAME
y.reg.names <- us.shape48$NAME

set.seed(3456)
par(mfrow=c(2,2))
sat.analysis <- ref.analysis(system.path,X,Y,x.reg.names,y.reg.names,shp.reg.names = NULL,iters=15000,burnin=5000,verbose = FALSE,tauc.start=.1,beta.start=-1,sigma2.start=.1,step.tauc=0.5,step.sigma2=0.5)

names(sat.analysis)

