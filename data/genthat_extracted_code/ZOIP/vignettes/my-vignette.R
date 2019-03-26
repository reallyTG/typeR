## ----eval=FALSE----------------------------------------------------------
#  if (!require('devtools')) install.packages('devtools') devtools::install_github('jucdiaz/ZOIP', force=TRUE)
#  library(ZOIP)

## ----eval=FALSE----------------------------------------------------------
#  dZOIP(x, mu = 0.5, sigma = 0.1, p0 = 0.08333333, p1 = 0.08333333,family='R-S', log = FALSE)

## ----echo=FALSE,message=FALSE--------------------------------------------
library(ZOIP)

## ------------------------------------------------------------------------
dZOIP(x=0.5, mu = 0.2, sigma = 0.5, p0 = 0.2, p1 = 0.2,family='R-S',log = FALSE)
dZOIP(x=0.5, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='F-C',log = FALSE)
dZOIP(x=0.5, mu = 0.6, sigma = 2.4, p0 = 0.2, p1 = 0.2,family='Original',log = FALSE)
dZOIP(x=0.5, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='Simplex',log = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  pZOIP(q, mu = 0.5, sigma = 0.1, p0 = 0.08333333, p1 = 0.08333333,family='R-S',lower.tail = TRUE, log.p = FALSE)

## ------------------------------------------------------------------------
pZOIP(q=0.5, mu = 0.2, sigma = 0.5, p0 = 0.2, p1 = 0.2,family='R-S', log = FALSE)
pZOIP(q=0.5, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='F-C', log = FALSE)
pZOIP(q=0.5, mu = 0.6, sigma = 2.4, p0 = 0.2, p1 = 0.2,family='Original', log = FALSE)
pZOIP(q=0.5, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='Simplex', log = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  qZOIP(p, mu = 0.5, sigma = 0.1, p0 = 0.08333333, p1 = 0.08333333,family='R-S',lower.tail = TRUE, log.p = FALSE)
#  

## ------------------------------------------------------------------------
qZOIP(p=0.7, mu = 0.2, sigma = 0.5, p0 = 0.2, p1 = 0.2,family='R-S', log = FALSE)
qZOIP(p=0.7, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='F-C', log = FALSE)
qZOIP(p=0.7, mu = 0.6, sigma = 2.4, p0 = 0.2, p1 = 0.2,family='Original', log = FALSE)
qZOIP(p=0.7, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='Simplex', log = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  rZOIP(n, mu = 0.5, sigma = 0.1,p0 = 0.08333333, p1 = 0.08333333,family='R-S')

## ------------------------------------------------------------------------
a1<-rZOIP(n=1000, mu = 0.2, sigma = 0.5, p0 = 0.2, p1 = 0.2,family='R-S')
plot(density(a1),main=expression(paste("Distribucion beta Parametrizacion R-S ",mu==0.2,", ",sigma==0.5,", ", "p0=0.2",", ","p1=0.2"))
,xlab='Proporcion',ylab='Frecuencia')
a2<-rZOIP(n=1000, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='F-C')
plot(density(a2),main=expression(paste("Distribucion beta Parametrizacion F-C ",mu==0.2,", ",phi==3,", ", "p0=0.2",", ","p1=0.2"))
,xlab='Proporcion',ylab='Frecuencia')
a3<-rZOIP(n=1000, mu = 0.6, sigma = 2.4, p0 = 0.2, p1 = 0.2,family='Original')
plot(density(a3),main=expression(paste("Distribucion beta Parametrizacion Original ",p==0.6,", ",q==2.4,", ", "p0=0.2",", ","p1=0.2"))
,xlab='Proporcion',ylab='Frecuencia')
a4<-rZOIP(n=10, mu = 0.2, sigma = 3, p0 = 0.2, p1 = 0.2,family='Simplex')
plot(density(a4),main=expression(paste("Distribucion Simplex ",mu==0.2,", ",sigma==3,", ", "p0=0.2",", ","p1=0.2"))
,xlab='Proporcion',ylab='Frecuencia')

