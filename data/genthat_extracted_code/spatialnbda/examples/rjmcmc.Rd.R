library(spatialnbda)


### Name: rjmcmc
### Title: Model discriminiation in a Bayesian context for spatial NBDA.
### Aliases: rjmcmc

### ** Examples


#Example 1
data(timearray)
data(idarray)
data(socialx)
data(socialy)

Times = timearray[,1]
Ids = idarray[,1]
lenh = length(Times)
Groups = rep(1,length(Times))
Events = c(1:length(Times))

socialites = matrix(1,nrow=lenh,ncol=lenh)
x = socialx
y = socialy

plot(x[,1],y[,1],xlab="x",ylab="y",cex=2,pch=16,main="Point pattern of nest positions")

areas = calculate.areas(x[,1],y[,1],rep(0.2,lenh),1000)
spatialareas = areas
len = length(x[,1])
Diffusions = rep(1,len)
for(i in 2:10){
  addon = rep(i,len)
  Diffusions = c(Diffusions,addon)
  
}


spatialnetwork = matrix(0,nrow=len,ncol=len)
for(i in 1:len){
  for(j in i:len){ 
    template = spatialareas[[i]][j]
    spatialnetwork[i,j] = spatialnetwork[j,i] = template
    #spatialareas[[i]]=NULL
    
  }
  
}


shape = FormatData(Times,spatialnetwork,Ids,Groups,Diffusions,Events,spatialnetwork)



#ptm <- proc.time()
#mcmc(shape,10000,0.05,0.05,-3,-5)
#proc.time() - ptm

#ptm <- proc.time()
#rjmcmc(shape,10000,5,1,-3,-3,1,10,10)
#proc.time() - ptm


# Example 2
data(papertimes)
data(papernests)
data(x)
data(y)
z = array(0,c(length(x[,1]),1))# setting up array for storing spatial covariate information

for(i in 1:70){   # simulating spatial covariate information
xx = x[,1][i]
yy = y[,1][i]
z[i] = (3*xx + 14*yy) * exp(2 * (.4*xx - 1)) 
}



Times = papertimes[,1]
Ids = papernests[,1]
Diffusions = rep(1,length(Times))
Groups = rep(1,length(Times))
Events = c(1:length(Times))
socialites = matrix(1,nrow=70,ncol=70)


plot(x[,1],y[,1],xlab="x",ylab="y",cex=2,pch=16,main="Point pattern of nest positions")



areas = calculate.areas(x[,1],y[,1],rep(0.05,70),1000)
spatialareas = areas
len = length(x[,1])

spatialnetwork = matrix(0,nrow=len,ncol=len)
for(i in 1:len){
  for(j in i:len){ 
    template = spatialareas[[i]][j]
    spatialnetwork[i,j] = spatialnetwork[j,i] = template
    #spatialareas[[i]]=NULL
    
  }
  
}


shape = FormatData(Times,spatialnetwork,Ids,Groups,Diffusions,Events,spatialnetwork,z)


#ptm <- proc.time()
#mcmc(shape,10000,5,1,-5,-6)
#proc.time() - ptm

#ptm <- proc.time()
#nullmcmc(shape,10000,1,-5)
#proc.time() - ptm


#ptm <- proc.time()
#rjmcmc(shape,10000,5,1,0,0,2,5,5)
#proc.time() - ptm






