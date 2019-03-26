library(pcmabc)


### Name: PCM_ABC
### Title: ABC estimation for PCMs
### Aliases: PCM_ABC
### Keywords: models htest

### ** Examples

## simulate 3d OUBM model
## This example requires the R package TreeSim 
## (to generate the tree in phylo format).
set.seed(12345)

phyltree<-TreeSim::sim.bd.taxa(numbsim=1,n=15,lambda=1,mu=0)[[1]]

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

sde.params<-list(a11=2.569531,a12=0,a21=0,a22=28.2608,b11=-5.482939,
b21=-34.806936,s11=0.5513215,s12=1.059831,s22=1.247302,s33=1.181376,
psi1=10,psi2=-10)
X0<-c(10,4.103157,3.834698)
step<-0.5 ## for keeping example's running time short <5s as CRAN policy, 
            ## in reality should be much smaller e.g. step<-0.001          
simres<-simulate_phenotype_on_tree(phyltree, simulate_mvsl_sde, sde.params, X0, step)

## extract the measurements at the tips
phenotypedata<-get_phylogenetic_sample(simres)

birth.params<-list(rate=10,maxval=10,abcstepsd=0.01,positivevars=c(TRUE,TRUE),
fixed=c(FALSE,TRUE))

sde.params<-list(a11=2.569531,a12=0,a21=0,a22=28.2608,b11=-5.482939,
b21=-34.806936,s11=0.5513215,s12=1.059831,s22=1.247302,s33=1.181376,
psi1=10,psi2=-10,
positivevars=c(TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,FALSE),
abcstepsd=rep(0.1,12))

par0<-list(phenotype.model.params=sde.params,birth.params=birth.params)
fbirth<-"rate_const" 
fdeath<-NULL
X0<-c(10,4.103157,3.834698)
step<-0.05 ## for keeping example's running time short <5s as CRAN policy, 
            ## in reality should be much smaller e.g. step<-0.001          
abcsteps<-2 ## for keeping example's running time short <5s as CRAN policy, 
          ## in reality should be much larger e.g. abcsteps<-500
eps<-1 ## for toy example's output to be useful, 
          ## in reality should be much smaller e.g. eps<-0.25
## estimate parameters
ABCres<-PCM_ABC(phyltree=phyltree,phenotypedata=phenotypedata,
par0=par0,phenotype.model=simulate_mvsl_sde,fbirth=fbirth,fdeath=fdeath,X0=X0,
step=step,abcsteps=abcsteps,eps=eps)



