library(RHawkes)


### Name: sim.pred
### Title: Simulate a fitted RHawkes process model
### Aliases: sim.pred
### Keywords: predict simulations

### ** Examples

N <- 5; i <- 0;
data(quake); tms <- sort(quake$time);
# add some random noise the simultaneous occuring event times
tms[213:214] <- tms[213:214] + 
                    sort(c(runif(1, -1, 1)/(24*60), runif(1, -1, 1)/(24*60)))
# simulate future event time based on MLE fitted Rhawkes model
times <- replicate(N,
                   {cat(i<<-i+1,'\n');
                   sim.pred(tms = tms, par = c(0.314, 22.2, 1266, 0.512),
                            cens=35063)
                   })
plot(NA,NA,xlim=c(0,35063*1.5),ylim=c(0,max(lengths(times))+nrow(quake)),
     xlab="time",ylab="Sample path")
lines(c(0,quake$time),0:nrow(quake),type="s")
for(i in 1:N)
    lines(c(tail(quake$time,1),times[[i]]),nrow(quake)+0:length(times[[i]]),
          type="s",lty=2)



