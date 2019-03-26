library(amen)


### Name: ame_rep
### Title: AME model fitting routine for replicated relational data
### Aliases: ame_rep

### ** Examples


data(YX_bin_long) 
fit<-ame_rep(YX_bin_long$Y,YX_bin_long$X,burn=5,nscan=5,odens=1,model="bin")
# you should run the Markov chain much longer than this




