library(pcmabc)


### Name: simulate_phylproc
### Title: Simultaneously simulate a phylogeny and a trait evolving on it.
### Aliases: simulate_phylproc
### Keywords: datagen

### ** Examples

## simulate 3d OUBM model with id branching rate
set.seed(12345)

simulate_mvsl_sde<-function(time,params,X0,step){
    A <- c(paste("(-",params$a11,")*(x1-(",params$psi1,"))
    -(",params$a12,")*(x2-(",params$psi2,"))-(",params$b11,")*x3",sep=""),
    paste("(-",params$a21,")*(x1-(",params$psi1,"))
    -(",params$a22,")*(x2-(",params$psi2,"))-(",params$b21,")*x3",sep=""),0)
    S <- matrix( c( params$s11, params$s12, 0, 0, params$s22 
    , 0, 0, 0, params$s33), 3, 3,byrow=TRUE)
    yuima.3d <- yuima::setModel(drift = A, diffusion = S,
    state.variable=c("x1","x2","x3"),solve.variable=c("x1","x2","x3") )
    simulate_sde_on_branch(time,yuima.3d,X0,step)
}

birth.params<-list(scale=1,maxval=2)

sde.params<-list(a11=2.569531,a12=0,a21=0,a22=28.2608,b11=-5.482939,
b21=-34.806936,s11=0.5513215,s12=1.059831,s22=1.247302,s33=1.181376,
psi1=-2.4590422,psi2=-0.6197838)
X0<-c(5.723548,4.103157,3.834698)
step<-0.25 ## for keeping example's running time short <5s as CRAN policy, 
            ## in reality should be much smaller e.g. step<-0.001          
            
simres<-simulate_phylproc(3.5, sde.params, X0, fbirth="rate_id", fdeath=NULL, 
fbirth.params=NULL, fdeath.params=NULL, fsimulphenotype=simulate_mvsl_sde, 
n.contemporary=5, n.tips.total=-1, step=step)



