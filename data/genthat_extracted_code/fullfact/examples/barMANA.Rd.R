library(fullfact)


### Name: barMANA
### Title: Bargraph of confidence intervals
### Aliases: barMANA

### ** Examples


##Import bootstrap resampling results
data(chinook_bootS) #Chinook salmon offspring survival
#Extract un-corrected confidence interval
survival_ci<- ciMANA(comp=chinook_bootS,trait="survival")
survival_ci

#Default plot
barMANA(ci_dat=survival_ci)
#Add plot modifications
barMANA(ci_dat=survival_ci,bar_len=0.3,yunit=5,ymax=20,cex_ylab=1.3)

##Import jackknife resampling results
data(chinook_jackL)  #Chinook salmon offspring length
#Extract jackknife confidence interval
length_ci<- ciJack2(comp=chinook_jackL,full=c(0.0000000,0.7192253,0.2029684,1.0404425,
0.1077423),position="tray",trait="length")
length_ci

#Default plot
barMANA(ci_dat=length_ci)
#Add plot modifications
barMANA(ci_dat=length_ci,bar_len=0.3,yunit=20,ymax=100,cex_ylab=1.3)

##Group survival and length together in the same plot
data(chinook_bootL) #Chinook salmon offspring length
length_ci2<- ciMANA2(comp=chinook_bootL,position="tray",trait="length")
length_ci2
#
comb_r<- rbind(survival_ci$raw,length_ci2$raw)
comb_p<- rbind(survival_ci$percentage,length_ci2$percentage)
comb_ci<- list(raw=comb_r,percentage=comb_p)

#Default plot
barMANA(ci_dat=comb_ci)
#Add plot modifications
barMANA(ci_dat=comb_ci,bar_len=0.3,yunit=20,ymax=100,cex_ylab=1.3,leg="topleft")



