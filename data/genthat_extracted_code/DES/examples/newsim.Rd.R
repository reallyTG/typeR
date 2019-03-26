library(DES)


### Name: newsim,schedevnt,getnextevnt,mainloop,newqueue,appendfcfs,delfcfs,cancelevnt,exparrivals
### Title: Discrete-event simulation routines.
### Aliases: newsim cancelevnt schedevnt getnextevnt mainloop newqueue
###   appendfcfs delfcfs exparrivals

### ** Examples

# from MachRep.R in examples/ 

# create a sim list that will run for 100000 simulated time, with 3
# rows allocated for the event set, and application-specific columns
# named 'startqtime' and 'startuptime'
simlist <- newsim(100000,3,appcols=c('startqtime','startuptime'))
# create a queue
simlist$queue <- newqueue(simlist)  



