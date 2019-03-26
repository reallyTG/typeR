library(MAPLES)


### Name: MAPLES-package
### Title: Smoothed age profile estimation.
### Aliases: MAPLES-package MAPLES
### Keywords: package smooth age profiles transition rates GAM models

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

# Estimates age profiles for the transition to the first birth 
# according to the following factors: 
# sex (respondent'sex w/2 levels: 'Male', 'Female');
# edu ('Level of education w/3 levels: 'low_sec','upp_sec', 'tert');
# mar (ever married w/2 levels: 'not_marr', 'marr') 

ch1.ap<-ageprofile(formula=~sex+edu+mar, epdata=ep2, 
                   tr.name="First child", agelimits=c(15,50))        

# Plot age profiles in three different graphs
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("Male","Female"),title='first child by sex')
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("low_sec","upp_sec","tert"),title='first child by education')
plotap(ch1.ap,base=TRUE, unsmoo=TRUE,
        lev=c("not_marr","marr"),title='first child by marital status', 
        ylim=0.4) 



