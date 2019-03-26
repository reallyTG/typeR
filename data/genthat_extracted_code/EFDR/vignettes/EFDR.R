## ----message=FALSE-------------------------------------------------------
library(EFDR)
library(fields)

## ----fig.width=4.25, fig.height=4----------------------------------------
n = 64
Z <- test_image(n1=n)$z
Z_noisy <- Z + 0.2*rnorm(n^2)
fields::image.plot(Z,zlim=c(-0.5,1.5),asp=1)
fields::image.plot(Z_noisy,zlim=c(-0.5,1.5),asp=1)

## ------------------------------------------------------------------------
alpha =     0.05        # 5% significant level
wf =        "la8"       # wavelet name
J =         3           # 3 resolutions
b =         11          # 11 neighbours for EFDR tests
n.hyp =     c(5,10,20,30,40,60,80,100,400,800,1200,2400,4096)  # find optimal number of tests in 
                                                               # EFDR from this list
iteration = 100         # number of iterations in MC run when finding optimal n in n.hyp
idp =       0.5         # inverse distance weighting power
nmax =      15          # maximum number of points to consider when carrying out inverse 
                        # distance interpolation
parallel =  parallel::detectCores()/2 # use half the number of available cores
set.seed(20)            # same random seed for reproducibility

## ----cache=FALSE---------------------------------------------------------
m1 <- test.bonferroni(Z_noisy, wf=wf,J=J, alpha = alpha)
m2 <- test.fdr(Z_noisy, wf=wf,J=J, alpha = alpha)
m3 <- test.los(Z_noisy, wf=wf,J=J, alpha = alpha)
m4 <- test.efdr(Z_noisy, wf="la8",J=J, alpha = alpha, n.hyp = n.hyp, 
                b=b,iteration=iteration,parallel = parallel)

## ----fig.width=6.25, fig.height=6.65-------------------------------------
par(mfrow=c(2,2))
fields::image.plot(m1$Z,main = "Bonferroni",zlim=c(-1.5,2),asp=1)
fields::image.plot(m2$Z,main = "FDR",zlim=c(-1.5,2),asp=1)
fields::image.plot(m3$Z,main = "LOS",zlim=c(-1.5,2),asp=1)
fields::image.plot(m4$Z,main = "EFDR",zlim=c(-1.5,2),asp=1)

## ------------------------------------------------------------------------
sig <- wav_th(Z,wf=wf,J=J,th=1)
cat(paste0("Power of Bonferroni test: ",fdrpower(sig,m1$reject_coeff)),
    paste0("Power of FDR test: ",fdrpower(sig,m2$reject_coeff)),
    paste0("Power of LOS test: ",fdrpower(sig,m3$reject_coeff)),
    paste0("Power of EFDR test: ",fdrpower(sig,m4$reject_coeff)),sep="\n")

## ------------------------------------------------------------------------
### Bonferroni diagnostic table:
diagnostic.table(sig,m1$reject_coeff,n = n^2)
### FDR diagnostic table:
diagnostic.table(sig,m2$reject_coeff,n = n^2)
### LOS diagnostic table:
diagnostic.table(sig,m3$reject_coeff,n = n^2)
### EFDR diagnostic table:
diagnostic.table(sig,m4$reject_coeff,n = n^2)

## ----fig.width=4.25, fig.height=4,cache=FALSE----------------------------
set.seed(1) # for reproducibility
Z <- test_image(n1=n)$z
Z_noisy <- Z + 2*rnorm(n^2)
fields::image.plot(Z_noisy)
        
m1 <- test.bonferroni(Z_noisy, wf=wf,J=J, alpha = alpha)
m2 <- test.fdr(Z_noisy, wf=wf,J=J, alpha = alpha)
m3 <- test.los(Z_noisy, wf=wf,J=J, alpha = alpha)
m4 <- test.efdr(Z_noisy, wf="la8",J=J, alpha = alpha, n.hyp = n.hyp, 
                b=b,iteration=iteration,parallel = parallel)

## ----fig.width=6.25, fig.height=6.65-------------------------------------
par(mfrow=c(2,2))
fields::image.plot(m1$Z,main = "Bonferroni", zlim=c(-1.5,2),asp=1)
fields::image.plot(m2$Z,main = "FDR", zlim=c(-1.5,2),asp=1)
fields::image.plot(m3$Z,main = "LOS", zlim=c(-1.5,2),asp=1)
fields::image.plot(m4$Z,main = "EFDR", zlim=c(-1.5,2))

sig <- wav_th(Z,wf=wf,J=J,th=1)        
cat(paste0("Power of Bonferroni test: ",fdrpower(sig,m1$reject_coeff)),
    paste0("Power of FDR test: ",fdrpower(sig,m2$reject_coeff)),
    paste0("Power of LOS test: ",fdrpower(sig,m3$reject_coeff)),
    paste0("Power of EFDR test: ",fdrpower(sig,m4$reject_coeff)),sep="\n")        

## ----message=FALSE,cache=FALSE-------------------------------------------
library(RCurl)
airs.raw <- read.table(textConnection(getURL(
                "http://hpc.niasra.uow.edu.au/ckan/dataset/6ddf61bb-2f9a-424a-8775-e23ebaa55afb/resource/e1206e1c-9dca-42b6-8455-3cdd98c6a943/download/airs2003may116.csv"
                )),header=T,sep=",")

## ----message=FALSE,cache=FALSE-------------------------------------------
library(dplyr)
airs.raw <- airs.raw %>%
  subset(lat > 14 & lat < 66 & lon > -145 & lon < -52) %>%
  mutate(x=lon,y=lat,z=co2avgret) %>%
  select(day,x,y,z)

## ----echo=FALSE----------------------------------------------------------
library(dplyr)

## ----fig.height=3,fig.width=6--------------------------------------------
library(ggplot2)
NorthAmerica <- map_data("world") %>%
                  subset(region %in% c("USA","Canada","Mexico"))
par(pin = c(5,1))
ggplot() + 
    geom_point(data=subset(airs.raw,day%in% 1:3),aes(x=x,y=y,colour=z)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_colour_gradient(low="yellow",high="blue") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66))

## ----fig.height=3,fig.width=6--------------------------------------------
idp = 0.5
n1 = 256
n2 = 128

airs.interp1 <- airs.raw %>%
  subset(day %in% 1:3) %>%
  select(-day) %>%
  regrid(n1=n1,n2=n2,idp= idp,nmax = nmax) 
  # idp is the inverse distance power and 
  # nmax is the number of neighbours to consider
    
ggplot() + 
    geom_tile(data=airs.interp1,aes(x=x,y=y,fill=z)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_fill_gradient(low="yellow",high="blue") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66))

## ----cache=FALSE---------------------------------------------------------
airs.interp2 <- airs.raw %>%
  subset(day %in% 4:6) %>%
  select(-day) %>%
  regrid(n1=n1,n2=n2,idp= idp,nmax = nmax) 

airs.interp <- airs.interp2 %>%
  mutate(z = airs.interp1$z - airs.interp2$z)

## ----fig.height=3,fig.width=6--------------------------------------------
ggplot() + 
    geom_tile(data=airs.interp,aes(x=x,y=y,fill=z)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_fill_gradient2(low="blue",high="red", mid="#FFFFCC") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66))

## ----cache=FALSE---------------------------------------------------------
Z <- df.to.mat(airs.interp)
m1 <- test.bonferroni(Z, wf=wf,J=J, alpha = alpha)
m2 <- test.fdr(Z, wf=wf,J=J, alpha = alpha)
m3 <- test.los(Z, wf=wf,J=J, alpha = alpha)
m4 <- test.efdr(Z, wf="la8",J=J, alpha = alpha, n.hyp = n.hyp, 
                b=b,iteration=iteration,parallel = parallel)

## ----fig.height=4,fig.width=7--------------------------------------------
library(gridExtra)

airs.interp <- airs.interp %>% 
                  mutate(m1 = c(m1$Z),
                         m2 = c(m2$Z),
                         m3 = c(m3$Z),
                          m4 = c(m4$Z))

g1 <- ggplot() + 
    geom_tile(data=airs.interp,aes(x=x,y=y,fill=m1)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_fill_gradient2(low="blue",high="red", mid="#FFFFCC") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66)) + ggtitle("Bonferroni")
    
g2 <- ggplot() + 
    geom_tile(data=airs.interp,aes(x=x,y=y,fill=m2)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_fill_gradient2(low="blue",high="red", mid="#FFFFCC") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66)) + ggtitle("FDR")
    
g3 <- ggplot() + 
    geom_tile(data=airs.interp,aes(x=x,y=y,fill=m3)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_fill_gradient2(low="blue",high="red", mid="#FFFFCC") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66)) + ggtitle("LOS")
    
g4 <- ggplot() + 
    geom_tile(data=airs.interp,aes(x=x,y=y,fill=m4)) +
    geom_path(data=NorthAmerica,aes(x=long,y=lat,group=group)) +
    scale_fill_gradient2(low="blue",high="red", mid="#FFFFCC") +
    coord_fixed(xlim=c(-145,-52),ylim=c(14,66)) + ggtitle("EFDR")
    
gridExtra::grid.arrange(g1, g2, g3, g4, ncol=2)

