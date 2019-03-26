library(amen)


### Name: ame
### Title: AME model fitting routine
### Aliases: ame

### ** Examples


data(YX_frn) 
fit<-ame(YX_frn$Y,YX_frn$X,burn=5,nscan=5,odens=1,model="frn")
# you should run the Markov chain much longer than this

 



