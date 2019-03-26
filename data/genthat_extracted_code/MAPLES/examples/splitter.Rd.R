library(MAPLES)


### Name: splitter
### Title: Creates a time-varying factor variables within a episode-data.
### Aliases: splitter
### Keywords: datagen episode|data event|history|analysis survival
###   episode|splitting

### ** Examples

# creates an episode-data structure relating to the transition 
# childless-->first child
ep1<-with(demogr,epdata(start=dbirth, event=dch1, rcensor=dint, 
          birth=dbirth,id=id,
          addvar=subset(demogr,select=c(-id,-dbirth)))) 

# creates a new episode-data structure with a time-varying factor 
# variable relating to the status "never married" (not_marr) or 
# "ever married" (marr)  
ep2<-splitter(ep1,split=ep1$d1marr,tvar.lev=c("not_marr","marr"),
              tvar.name="mar")



