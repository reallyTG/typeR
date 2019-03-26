## ----message=FALSE-------------------------------------------------------
library(dplyr)
library(tidyr)
library(ggplot2)
library(foreach)
library(parallel)
library(doParallel)
library(RCurl)
library(animation)

## ----cache=FALSE---------------------------------------------------------
sst <- getURL("http://www.stat.missouri.edu/~wikle/SSTlonlat.dat") %>%
  textConnection() %>%
  read.table(col.names = c("x","y")) %>%
  cbind(getURL("http://www.stat.missouri.edu/~wikle/SST011970_032003.dat") %>%
          textConnection() %>%
          read.table()) %>%
  mutate(land = (getURL("http://www.stat.missouri.edu/~wikle/SSTlandmask.dat") %>%
           textConnection() %>%
           read.table())[,1]) %>% 
  gather(date,z,-x,-y,-land) %>%
  mutate(time = as.numeric(date)) %>%
  select(-date) %>%
  subset(x > 155 & x < 280 & y <14&land==0)

## ----cache=FALSE---------------------------------------------------------
### Set parameters
n1 =        64
n2 =        32
idp =       0.5
nmax =      6
alpha =     0.05        # 5% significant level
wf =        "la8"       # wavelet name
J =         3           # 3 resolutions
b =         5     
parallel =  detectCores()/2 # use half the number of available cores

## ----cache=TRUE,results='hide'-------------------------------------------
### Carry out EFDR on every frame
cl <- makeCluster(2)
registerDoParallel(cl)

X <- foreach (t = unique(sst$time),.combine=rbind) %dopar% {
  library(EFDR)
  sst_t <- subset(sst,time==t)
  sst_t_regrid <- regrid(sst_t,n1=n1,n2=n2,idp= idp,nmax = nmax)
  sst_t_regrid$zsig <- c(test.efdr(df.to.mat(sst_t_regrid), wf=wf,J=J, 
                                   alpha = alpha,parallel=parallel)$Z)
  sst_t_regrid$t <- t
  sst_t_regrid
}

stopCluster(cl)

## ------------------------------------------------------------------------
### Plotting
world<-map_data('world')%>%
  mutate(long = ifelse(long < 80,long + 360,long) ) %>%
  subset(long > 80 & long < 340)

base_plot <- ggplot() + 
    theme(panel.background = element_rect(fill='white', colour='black'),
             text = element_text(size=20),
             panel.grid.major =  element_line(colour = "light gray", size = 0.05),
             panel.border  = element_rect(fill=NA, colour='black')) + 
		geom_path(data=world,aes(x=long,y=lat,group=group)) +
		geom_rect(data=data.frame(x1=155,x2=280,y1=14,y2=-29),
			mapping=aes(xmin=x1,xmax=x2,ymin=y1,ymax=y2),
      alpha=0,colour="black",linetype="dashed")

mon <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
plot_time <- function(i) {
  base_plot + 
    geom_tile(data=subset(X,t==i),aes(x,y,fill=zsig,alpha=abs(zsig))) + 
    geom_text(data=data.frame(txt=paste(mon[(i-1)%%12+1],
                                         floor((i-1)/12)+1970)),
              aes(x=245, y = -50, label=txt),size=10) +
    scale_fill_gradient2(low="blue",mid="white",high="red",limits=c(-6,6)) +
    scale_alpha(guide = 'none') +
    guides(fill=guide_legend(title="degC"))+
    coord_fixed(xlim=c(120,300))   
}

## ----eval=FALSE----------------------------------------------------------
## ### Do video (NOT RUN)
## library(animation)
## oopt <- animation::ani.options(interval = 0.7)
## 
## FUN2 <- function() {
##  t = 1:399
##  lapply(t, function(i) {
##    print(plot_time(i))
##    ani.pause()
##  })
## }
## 
## FUN2()
## saveHTML(FUN2(), autoplay = FALSE, loop = FALSE, verbose = FALSE, outdir = ".",
##         single.opts = "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0")

## ----fig.height=6,fig.width=6,interval=1---------------------------------
#August 1972 strong El Niño event
plot_time(2*12 + 8)

## ----fig.height=6,fig.width=6,interval=1---------------------------------
#January 1974 strong La Niña event
plot_time(4*12 + 1)

## ----fig.height=6,fig.width=6,interval=1---------------------------------
#November 1975 strong La Niña event
plot_time(5*12 + 11)

## ----fig.height=6,fig.width=6,interval=1---------------------------------
#December 1982 strong El Niño event
plot_time(12*12 + 12)

## ----fig.height=6,fig.width=6,interval=1---------------------------------
#August 1997 strong El Niño event
plot_time(27*12 + 8)

