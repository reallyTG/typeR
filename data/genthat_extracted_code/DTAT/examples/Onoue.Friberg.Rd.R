library(DTAT)


### Name: Onoue.Friberg
### Title: POMP PK/PD model for docetaxel, combining Onoue et al (2016)
###   with Friberg et al (2002)
### Aliases: Onoue.Friberg

### ** Examples

# Reproduce the sim$pkpd model and sim$pop population from reference #3:
library(pomp)
Onoue.Friberg(N=25)
sim$pop # NB: this differs from pop of original paper...

# Whereas the present version of Onoue.Friberg() draws simulated populations
# using pomp::rprior(), to reproduce the original F1000Research paper [3] we
# re-draw sim$pop as originally & prosaically done (see https://osf.io/vwnqz/):
set.seed(2016)
N <- 25
dtx.mm <- 0.808 # molar mass (mg/µM) of docetaxel
sim$pop$Circ0 <- rlnorm(N, meanlog=log(5050), sdlog=0.42) # units=cells/mm^3
sim$pop$MTT <- rlnorm(N, meanlog=log(89.3), sdlog=0.16)  # mean transit time
sim$pop$gamma <- rlnorm(N, meanlog=log(0.163), sdlog=0.039) # feedback factor
sim$pop$Emax <- rlnorm(N, meanlog=log(83.9), sdlog=0.33)
sim$pop$EC50 <- rlnorm(N, meanlog=log(7.17*dtx.mm), sdlog=0.50)
# PK params from 2-compartment docetaxel model of Onoue et al (2016)
sim$pop$CL <- rlnorm(N, meanlog=log(32.6), sdlog=0.295)
sim$pop$Q  <- rlnorm(N, meanlog=log(5.34), sdlog=0.551)
sim$pop$Vc <- rlnorm(N, meanlog=log(5.77), sdlog=0.1) # Onoue gives no CV% for V1
sim$pop$Vp <- rlnorm(N, meanlog=log(11.0), sdlog=0.598) # Called 'V2' in Onoue
sim$pop$kTR=4/sim$pop$MTT

# Now we run the sim$pkpd model, separately for each of N simultated individuals:
allout <- data.frame() # accumulator for N individual ODE solutions
for (id in 1:sim$N) {
  out <- trajectory(sim$pkpd,
                    params=c(sim$pop[sim$pop$id==id, -which(names(sim$pop) %in% c('id','MTT'))]
                             , sigma=0.05, dose=100, duration=1),
                    as.data.frame=TRUE)
  # drop 'traj' and shift 'time' to first column
  out <- out[,c('time',setdiff(colnames(out),c('time','traj')))]
  out$id <- paste("id",id,sep="")
  allout <- rbind(allout, out)
}

library(Hmisc)
allout <- upData(allout
                 , id = ordered(id, levels=paste("id",1:sim$N,sep=""))
                 , units=c(Prol="cells/mm^3", Tx.1="cells/mm^3",
                           Tx.2="cells/mm^3", Tx.3="cells/mm^3",
                           Circ="cells/mm^3", CircMin="cells/mm^3",
                           tNadir="hours", Cc="ng/mL", Cp="ng/mL",
                           time="hours"), print=FALSE)

library(tidyr)
cout <- gather(allout, key="Series", value="Concentration"
, Cc, Cp
, factor_key = TRUE)

label(cout$Concentration) <- "Drug Concentration"

# Figure 1 from reference [3]:
library(RColorBrewer)
xYplot(Concentration ~ time | id, group=Series
       , data=cout, subset=time<6
       , layout=c(5,NA)
       , type='l', as.table=TRUE
       , label.curves=FALSE
       , par.settings=list(superpose.line=list(lwd=2,col=brewer.pal(4,"PRGn")[c(1,4)]))
       , scales=list(y=list(log=TRUE, lim=c(10^-3,10^1)))
       , auto.key=list(points=FALSE, lines=TRUE, columns=2))

mout <- gather(allout, key="Series", value="ANC"
, Prol, Tx.1, Tx.2, Tx.3, Circ
, factor_key = TRUE)

mout <- upData(mout
               , time = time/24
               , units = c(time="days")
               , print = FALSE)

# Figure 3 from citation [3]:
xYplot(ANC ~ time | id, group=Series
       , data=mout
       , layout=c(5,5)
       , type='l', as.table=TRUE
       , label.curves=FALSE
       , par.settings=list(superpose.line=list(lwd=2,col=brewer.pal(11,"RdYlBu")[c(1,3,4,8,10)]))
       , scales=list(y=list(log=TRUE, lim=c(100,15000), at=c(200, 500, 1000, 2000, 5000, 10000)))
       , auto.key=list(points=FALSE, lines=TRUE, columns=5))




