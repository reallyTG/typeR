library(skda)


### Name: cvskda
### Title: Cross validation for SKDA
### Aliases: cvskda
### Keywords: file

### ** Examples



        # a binary example
          rm(list=ls())
          n=200
          p=20
          r=0.8
          x=matrix(rnorm(n*p,mean=0,sd=1),n,p)
          y=rbinom(n,1,0.5)
          x[,3]=x[,3]+(2*y-1)*r
          x[,11]=x[,11]+(2*y-1)*r

          y=y+1

          ind1=which(y>1.5)
          ind0=which(y<1.5)
          plot(-4:4, -4:4, type = "n")
          points(x[ind1, 3], x[ind1,11],col="blue")
          points(x[ind0, 3], x[ind0,11],col="red")
          lam=skda(x,y,3)$lam
          
# for cross validation see demo(cvskda, package="skda", ask=TRUE)


        # a three-class example
          rm(list=ls())
          n=200
          p=20
          r=2
          x=matrix(rnorm(n*p,mean=0,sd=1),n,p)
          y=ceiling(runif(n,0,3))
          thetas=c(0, 2*pi/3, 4*pi/3)
          x[,3]=x[,3]+r*cos(thetas[y])
          x[,11]=x[,11]+r*sin(thetas[y])

          ind1=which(y==1)
          ind2=which(y==2)
          ind3=which(y==3)

          plot(-6:6, -6:6, type = "n")
          points(x[ind1, 3], x[ind1,11],col="blue")
          points(x[ind2, 3], x[ind2,11],col="red")
          points(x[ind3, 3], x[ind3,11],col="black")
          lam=skda(x,y,3)$lam

# for cross validation see demo(cvskda, package="skda", ask=TRUE)





