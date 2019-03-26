library(lmfor)


### Name: NR
### Title: Solve simple equations using Newton-Raphson algorithm.
### Aliases: NR
### Keywords: numerical computations

### ** Examples

## Numerically solve Weibull shape for a stand
## where DGM=15cm, G=15m^2/ha and N=1000 trees per ha
func<-function(shape,G,N,DGM) {
##      print(G,DGM,N)
      val<-pi/(4*gamma(1-2/shape)*log(2)^(2/shape))-G/(N*DGM^2)
      val
      }

grad<-function(shape) {
      pi/4*(-1)*                                                            
      (gamma(1-2/shape)*log(2)^(2/shape))^(-2)*                             
      (gamma(1-2/shape)*digamma(1-2/shape)*2*shape^(-2)*log(2)^(2/shape)+   
      log(2)^(2/shape)*log(log(2))*(-2)*shape^(-2)*gamma(1-2/shape))         
      }
      
shape<-NR(5,fn=function(x) func(x,G=10000*15,1000,15),gr=grad,crit=10,range=c(2.1,Inf))$par



