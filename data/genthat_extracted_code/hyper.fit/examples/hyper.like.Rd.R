library(hyper.fit)


### Name: hyper.like
### Title: The likelihood of a given set of data and an specified
###   hyperplane
### Aliases: hyper.like
### Keywords: likelihood hyper

### ** Examples

#Setup the initial data:

set.seed(650)
sampN=200
initscat=3
randatax=runif(sampN, -100,100)
randatay=rnorm(sampN, sd=initscat)
sx=runif(sampN, 0,10); sy=runif(sampN, 0,10)

mockvararray=makecovarray2d(sx, sy, corxy=0)

errxy={}
for(i in 1:sampN){
  rancovmat=ranrotcovmat2d(mockvararray[,,i])
  errxy=rbind(errxy, mvrnorm(1,mu=c(0,0), Sigma=rancovmat))
  mockvararray[,,i]=rancovmat
  }
randatax=randatax+errxy[,1]
randatay=randatay+errxy[,2]

#Rotate the data to an arbitrary angle theta:

ang=30
mock=rotdata2d(randatax, randatay, theta=ang)
xerrang={}; yerrang={}; corxyang={}
for(i in 1:sampN){
  covmatrot=rotcovmat(mockvararray[,,i], theta=ang)
  xerrang=c(xerrang, sqrt(covmatrot[1,1])); yerrang=c(yerrang, sqrt(covmatrot[2,2]))
  corxyang=c(corxyang, covmatrot[1,2]/(xerrang[i]*yerrang[i]))
}
corxyang[xerrang==0 & yerrang==0]=0
mock=data.frame(x=mock[,1], y=mock[,2], sx=xerrang, sy=yerrang, corxy=corxyang)

#Do the fit:

X=cbind(mock$x, mock$y)
covarray=makecovarray2d(mock$sx, mock$sy, mock$corxy)

#Create our orthogonal vector. This does not need to be normalised to 1:

coord.orth=hyper.convert(coord=ang, in.coord.type = "theta", out.coord.type = "normvec")

#Feed this into the hyper.like function:

print(hyper.like(parm=coord.orth$parm, X, covarray, errorscale=1, output = "sum"))

#Comapre to a worse option:

print(hyper.like(parm=c(0.5, -1, 0, 4), X, covarray, errorscale=1, output = "sum"))

#As we can see, the paramters used to generate the data produce a higher likelihood.



