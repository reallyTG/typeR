library(spatialnbda)


### Name: mcmcre
### Title: Performs NBDA with individual level random effects
### Aliases: mcmcre

### ** Examples


# library(calibrate)
# loading the x and y spatial coordinates to construct the spatially derived 
#social network

data(Xx)
data(Yy)

X <- cbind(Xx,Yy)
plot(X[,1],X[,2],pch=16,cex=1,xlim=c(0,1),ylim=c(0,1),xlab="x",
ylab="y",main="",cex.axis=2,cex.lab=2)

areas = calculate.areas(X[,1], X[,2], rep(0.2,length(X[,1])), 1000)
spatialareas = areas
len = length(X[,1])

spatialnetwork = matrix(0,nrow=len,ncol=len)
for(i in 1:len){
  for(j in i:len){ 
    template = spatialareas[[i]][j]
    spatialnetwork[i,j] = spatialnetwork[j,i] = template
    #spatialareas[[i]]=NULL
    
  }
  
}

# loading the times and ids to plot the diffusion times and run nbda

data(Times)
data(Ids)
numdiff = 10

plot_colors = colors()[c(12,28,31,32,34,37,41,47,59,62,146,176,258,117,154,625,563,376,113,556)]

for(i in 1:numdiff){
  a = (i-1) * (len)
  b = a + (len)
  startindex = a + 1
  endindex = b
  plot(Times[startindex:endindex,1],c(1:len),type="o",lwd=4,col=plot_colors[i],ylab="Solver index",
  main="",xlab="Time(s)",yaxt='n',ylim=c(0,len),xlim=range(Times))
  #textxy(c(1:len), Times[startindex:endindex,1], Ids[startindex:endindex,1],cex = .8,col="red")
  par(new=TRUE)
}
par(new=TRUE)
plot( Times[1:len,1],c(1:len),type="o",lwd=4,col=plot_colors[1],ylab="",main="",xlab="",
     ylim=c(0,len),xlim=range(Times))



Diffusions = rep(1,len)
for(i in 2:numdiff){
  addon = rep(i,len)
  Diffusions = c(Diffusions,addon)

}
Groups = rep(1,length(Times[,1]))
Events = c(1:length(Times[,1]))
space = rep(1,length(Times[,1]))
spatialnetwork = 1*spatialnetwork
shape = FormatData(Times[,1],spatialnetwork,Ids[,1],Groups,Diffusions,Events,spatialnetwork)

# running nbda to obtain posterior estimates of the social and 
# baseline rate parameters

#ptm <- proc.time()
#mcmc(shape,10000,0.05,0.05,-3,-5)
#proc.time() - ptm


# running nbda to obtain posterior estimates of the
# social, baseline rate and random effect parameters

#ptm <- proc.time()
#mcmcre(shape,10000,0.05,0.05,-3,-5)
#proc.time() - ptm



