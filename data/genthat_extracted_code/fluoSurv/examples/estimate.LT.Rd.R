library(fluoSurv)


### Name: estimate.LT
### Title: Estimation of time to death
### Aliases: estimate.LT

### ** Examples


##Loading data
data("galleria")
## dataset may contain NA if microplate reader has been stoped before the programmed
## end of the experiment
d <- subset(galleria,!is.na(value))
l  <- lapply(split(d,d$well),extract.well)

data(setup)
setup <- setup[match(setup$well,names(l)),]

## Computes rough estimates of variance in autofluorescence signal for dead and living insects
## These values serve as initial guess to fit the model.
offset.alive <- estimate.offset(l,"1_330_405",min.t=1,max.t=5)
    # all insects are assumed to be alive during the
    # first five hours that follow injection

offset.dead <- estimate.offset(l[which(setup$dead==1)],"1_330_405",min.t=72-5)
    # insects that were dead at the end of the experiment are
    # assumed to have died earlier than 5 hours before then
    # end of the experiment


## LT estimation or for a single well
## Check out well D9, to see what happens when an insect stayed alive.
well <- "A3"
plot(log(value_1_485_535,10)~t_1_485_535,type="l",col="green",ylim=c(2,5),data=l[[well]])
points(log(value_1_330_405,10)~t_1_330_405,type="l",col="gray",data=l[[well]])
    # Rough estimate obtained using no offsets
est1 <- with(l[[well]], estimate.LT(value_1_330_405,t_1_330_405,threshold.value=3))
abline(v=est1[["LT"]],lty=2,col="red")
    # Much better estimate obtained using offset for dead insects
est2 <- with(l[[well]], estimate.LT(value_1_330_405,t_1_330_405,
                                         offset.dead = offset.dead,threshold.value=3))
abline(v=est2["LT"],lty=3,col="red")
    # Using offset.alive does not change anything to the estimate for well A3
    # It may help for insect that have a larger variance in signal than others even after death
est3 <- with(l[[well]], estimate.LT(value_1_330_405,t_1_330_405,
                                         offset.dead = offset.dead,
                                         offset.alive = offset.alive,threshold.value=3))
abline(v=est3["LT"],col="red")
    # Detection of significant GFP fluorescence (i.e. log fluorescence exceed
    # by 5% the maximum value observed during the first five hours)
with(l[[well]],abline(v=when.threshold(t_1_485_535,log(value_1_485_535,10),
                                                            threshold=0.1),col="green"))


##LT estimation for all wells
if(FALSE) { #example takes time! Set to TRUE if you want to run it
   res <- sapply(l,function(x) estimate.LT(x$value_1_330_405,x$t_1_330_405,
                                               threshold.value=2,offset.dead=offset.dead,
                                               offset.alive=offset.alive))
  res <- as.data.frame(t(res))
##Adds LT estimates to the experimental setup data.frame
  setup <- cbind(setup,res[match(setup$well,rownames(res)),])
## Time of injection is added to LT, so that LT really corresponds to time post injection
  time <- with(setup,strptime(as.character(time_injection),format="%H:%M:%S"))
  time <- as.numeric((max(time)-time)/(60^2))
  setup$LT <- setup$LT+time


## Survival curves by dilution of bacterial culture injected
  library(survival)
  plot(survfit(Surv(LT,dead)~dilution,data=setup),
     lwd=c(3:1,1),lty=c(1,1,1,2),
     xlab="hours post injection",ylab="proportion of surviving insects")
  abline(h=0.5,col="red")
  legend("topright",lwd=c(1,3:1),lty=c(2,1,1,1),legend=c("LB",10^(3:1)))

## When does scepticemia start?
  res <- sapply(l,function(x) when.threshold(x$t_1_485_535,log(x$value_1_485_535,10),
                                                                    threshold=0.1))
  setup$T_gfp <- res[match(setup$well,names(res))]
  setup$T_gfp <- setup$T_gfp + time

## Relation between time of death and moment when scepticemia is detected.
## Only points where scepticemia has been detected are represented here.
  plot(LT~T_gfp,data=setup,col=ifelse(dead,1,2),pch=as.numeric(dilution))
  abline(0,1)
  with(setup,legend("topleft",legend=levels(dilution),pch=1:4))
  # Most insects have died after scepticemia has started.
  }




