## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(rmetasim)
l <- landscape.new.example()

## ----echo=F--------------------------------------------------------------
SK <- matrix(c(0.8,0.2,
               0.5,0.5),byrow=T,ncol=2)
rownames(SK) <- paste("pop",1:2)
colnames(SK) <- paste("stage",1:2)
SK

## ------------------------------------------------------------------------
landscape.stagecarry <- function(l,sk)
{
    k=l$demography$epochs[[1]]$Carry # carrying capacities
    n=c(table(landscape.populations(l))) #pop sizes
    
    #next several lines are supposed to padd out extirpated populations in the popsize vector
    n2=rep(0,length(k))
    names(n2)=1:length(k)
    for(i in names(n)) {pos=which(names(n2)==i); n2[pos]=n[names(n)==i]}
    n=n2
    killrows <- unlist(lapply(1:length(k),function(i) #never that many populations, this is probably plenty fast
        {
          if (n[i]>k[i]) #population i has a pop size greater than carrying capacity  
           {
            poprows = which(landscape.populations(l)%in%i)
            abstages = (i-1)*dim(sk)[2] + 0:(dim(sk)[2]-1)
            absrows = lapply(abstages,function(stg)
                {which(l$individuals[,1]==stg)})
            inds.to.thin = ceiling(sk[i,] * (n[i]-k[i]))
            (sapply(1:dim(sk)[2], function(stg) { if (length(absrows[[stg]])>0) sample(absrows[[stg]],inds.to.thin[stg],replace=F) }))
            }
      }))

    if (!is.null(killrows)) l$individuals<-l$individuals[(-1)*killrows,]
    l
}

## ------------------------------------------------------------------------
rland <- landscape.new.example()
rland$demography$localdem[[1]]$LocalS <- matrix(c(0.5,0.5,0,0.05),nrow=2) #make sure that there is some complexity
gens=400
stagesize=matrix(0,ncol=4,nrow=gens)
for (gen in 1:gens)
    {

        rland <- landscape.extinct(rland)
        rland <- landscape.reproduce(rland)
        rland <- landscape.survive(rland)
        rland <- landscape.stagecarry(rland,SK)
        stagesize[gen,]  <- c(table(rland$individuals[,1]))

        rland <- landscape.carry(rland)   #if N is still > K which happens if there are few inds in a stage that you want to thin
                                          # apply the normal carry function (thins the remaining stages using the normal approach)
        rland <- landscape.advance(rland)
    }

## ------------------------------------------------------------------------
matplot(stagesize,type='l')
matplot(stagesize[100:gens,],type="l") #clip the first 100 time clicks.  resets the index to zero for gen 100

