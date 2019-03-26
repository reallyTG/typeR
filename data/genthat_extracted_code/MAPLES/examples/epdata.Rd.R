library(MAPLES)


### Name: epdata
### Title: Prepares episode data for event history analysis.
### Aliases: epdata
### Keywords: datagen episode data event history analysis survival

### ** Examples

# creates an episode-data structure relating 
# to the transition childless-->first child
ep1<-epdata(start=demogr$dbirth, 
            event=demogr$dch1,
            rcensor=demogr$dint,
            birth=demogr$dbirth,
            id=demogr$id,
            addvar=subset(demogr,select=c(-id,-dbirth)))    
                 
# or, using 'with'
ep1<-with(demogr,epdata(start=dbirth, event=dch1, 
          rcensor=dint, birth=dbirth,id=id,
          addvar=subset(demogr,select=c(-id,-dbirth))))



