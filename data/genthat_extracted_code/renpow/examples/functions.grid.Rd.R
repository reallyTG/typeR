library(renpow)


### Name: grid
### Title: Electrical Power Grid
### Aliases: grid infinite.bus seg.ts series.plot daily.min.max
###   load.duration
### Keywords: hplot dplot math

### ** Examples


x <- list(V=13.8,X=1,E=seq(14,16,1),delta=seq(6,30,1))
infinite.bus(x)

X <- ERCOT2010
x.t <- seg.ts(X,dh0="1/1/2010 1:00",dhf="1/1/2011 0:00",c(1:9))$x.t

# week day Monday Jan 04 2010
x.t.wd.wt <- seg.ts(X,dh0="1/4/2010 0:00",dhf="1/4/2010 23:00",c(1,5,7))$x.t.seg
series.plot(x.t.wd.wt) 

# week Sunday Jan 24 to Saturday Jan 30 2010
x.t.wd.wt <- seg.ts(X,dh0="1/24/2010 0:00",dhf="1/30/2010 23:00",c(1,5,7))$x.t.seg
series.plot(x.t.wd.wt)

# NORTH_C
x.t.y <- x.t[,5]; ylabel <- colnames(x.t)[5]; inst.cap <- c(10000,8000,8000) #MW
inst.lab <- c("Baseload","Intermediate", "Peaking")
daily.min.max(x.t.y,ylabel,inst.cap,inst.lab)

x.t.y <- x.t[,5]
inst.cap <- c(10000,8000,8000) # MW
inst.lab <- c("Baseload","Intermediate", "Peaking")
load.duration(x.t.y, inst.cap,inst.lab)




