library(RSEIS)


### Name: prepSEIS
### Title: Prepare structure for RSEIS
### Aliases: prepSEIS
### Keywords: misc

### ** Examples


data(sunspots)

ES <- prep1wig(wig=sunspots, dt=1/12, sta="STA",
           comp="CMP", units="UNITS" )

EH <- prepSEIS(ES)

STDLAB <- c("DONE",  "zoom out", "refresh", "restore",
      "XTR", "SPEC", "SGRAM" ,"WLET")

xx <-  swig( EH, STDLAB = STDLAB)
###################################
###################################


####################   example with multiple signals

dt <- 0.01
t <- seq(0, 60, by=0.01)
######    sample rate = 100 Hz, 0.001 seconds 601 samples

###  set up the fequencies and amplitudes for signals that have 2 frequencies
afreqs1 <- c(8, 13,12, 5 )
amps1 <- c(6, 2,3, 2 )
####
afreqs2 <- c(4,3,2, 3  )
amps2 <- c(10,5, 9, 2 )


 x <- cbind( amps1[1]*sin(2*pi*afreqs1[1]*t) + amps2[1]* sin(2*pi*afreqs2[1]*t),
amps1[2]*sin(2*pi*afreqs1[2]*t) + amps2[2]* sin(2*pi*afreqs2[2]*t),
amps1[3]*sin(2*pi*afreqs1[3]*t) + amps2[3]* sin(2*pi*afreqs2[3]*t),
amps1[4]*sin(2*pi*afreqs1[4]*t) + amps2[4]* sin(2*pi*afreqs2[4]*t))

d <- dim(x)

########  names of signals
mysta <- c("R1", "R2", "R3", "R4")

MYLIST <- list()

############  set up the initial list of wiggles
for(i in 1:d[2])
{

A <- prep1wig(wig =x[,i], sta=mysta[i], dt=dt, comp="DO", units="amp") 
A[[1]]$DATTIM$yr <- 2000
MYLIST <- c(MYLIST, A)

}

###  reorganize into RSEIS format:
PH1 <- prepSEIS(MYLIST)

STDLAB <- c("DONE",  "zoom out", "refresh", "restore",
           "XTR", "SPEC", "SGRAM" ,"WLET")

swig(PH1, STDLAB = STDLAB)




## Not run: 
##D ######  this example shows how to read data from SEGY files using Rsac
##D #####  and entering RSEIS
##D KG4 <- JGET.seis(c(fnames), kind = 1, PLOT = -1)
##D 
##D KH <- prepSEIS(KG4)
##D 
##D STDLAB <- c("DONE",  "zoom out", "refresh", "restore",
##D                 "XTR", "SPEC", "SGRAM" ,"WLET")
##D 
##D xx <-  swig( KH, sel=which(KH$COMPS == "V"), STDLAB = STDLAB)
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)




