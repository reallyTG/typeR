library(PTAk)


### Name: PTAk
### Title: Principal Tensor Analysis on k modes
### Aliases: PTAk
### Keywords: array algebra multivariate

### ** Examples


  # don <- array((1:3)%x%rnorm(6*4)%x%(1:10),c(10,4,6,3))

don <- array(1:360,c(5,4,6,3))
 don <- don + rnorm(360,1,2)

 dimnames(don) <- list(paste("s",1:5,sep=""),paste("T",1:4,sep=""),
          paste("t",1:6,sep=""),c("young","normal","old"))
   # hypothetic data on learning curve at different age and period of year

 ones <-list(list(v=rep(1,5)),list(v=rep(1,4)),list(v=rep(1,6)),list(v=rep(1,3)))

 don <- PROJOT(don,ones)
 don.sol <- PTAk(don,nbPT=1,nbPT2=2,minpct=0.01,
               verbose=TRUE,
                modesnam=c("Subjects","Trimester","Time","Age"),
                 addedcomment="centered on each mode")

don.sol[[1]] # mode Subjects results and components
don.sol[[2]] # mode Trimester results and components
don.sol[[3]] # mode Time results and components
don.sol[[4]] # mode Age results and  components with additional information on the call

 summary(don.sol,testvar=2)
  plot(don.sol,mod=c(1,2,3,4),nb1=1,nb2=NULL,
     xlab="Subjects/Trimester/Time/Age",main="Best rank-one approx" )
  plot(don.sol,mod=c(1,2,3,4),nb1=4,nb2=NULL,
      xlab="Subjects/Trimester/Time/Age",main="Associated to Subject vs1111")

#  demo function
 # demo.PTAk()

  


