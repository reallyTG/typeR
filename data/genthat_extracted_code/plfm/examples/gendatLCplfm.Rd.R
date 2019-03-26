library(plfm)


### Name: gendatLCplfm
### Title: Data generation
### Aliases: gendatLCplfm

### ** Examples

## Not run: 
##D # define constants
##D I<-500
##D J<-10
##D K<-8
##D F<-2
##D T<-2
##D 
##D # model 1
##D 
##D # generate true parameters
##D objpar<-array(runif(J*F*T),c(J,F,T))
##D attpar<-matrix(runif(K*F),c(K,F))
##D sizepar<-rep(1/T,T)
##D # generate data
##D d<-gendatLCplfm(N=I,objpar=objpar,attpar=attpar,sizepar=sizepar,maprule="conj",model=1)
##D # estimate parameters of true model
##D res<-LCplfm(data=d$data,F=2,T=2,model=1,maprule="conj")
##D 
##D 
##D # model 2
##D 
##D # generate true parameters
##D objpar<-matrix(runif(J*F),nrow=J)
##D attpar<-array(runif(K*F*T),c(K,F,T))
##D sizepar<-rep(1/T,T)
##D # generate data
##D d<-gendatLCplfm(N=I,objpar=objpar,attpar=attpar,sizepar=sizepar,maprule="conj",model=2)
##D # estimate parameters of true model
##D res<-LCplfm(data=d$data,F=2,T=2,model=2,maprule="conj")
##D 
##D # model 3
##D 
##D # generate true parameters
##D objpar<-array(runif(J*F*T),c(J,F,T))
##D attpar<-array(runif(K*F*T),c(K,F,T))
##D sizepar<-rep(1/T,T)
##D # generate data
##D d<-gendatLCplfm(N=I,objpar=objpar,attpar=attpar,sizepar=sizepar,maprule="conj",model=3)
##D # estimate parameters of true model
##D res<-LCplfm(data=d$data,F=2,T=2,model=3,maprule="conj")
##D 
##D # model 4
##D 
##D # generate true parameters
##D objpar<-array(runif(J*F*T),c(J,F,T))
##D attpar<-matrix(runif(K*F),c(K,F))
##D sizepar<-rep(1/T,T)
##D # generate data
##D d<-gendatLCplfm(N=I,objpar=objpar,attpar=attpar,sizepar=sizepar,maprule="conj",model=4)
##D # estimate parameters of true model
##D res<-LCplfm(data=d$data,F=2,T=2,model=4,maprule="conj")
##D 
##D # model 5
##D 
##D # generate true parameters
##D objpar<-matrix(runif(J*F),nrow=J)
##D attpar<-array(runif(K*F*T),c(K,F,T))
##D sizepar<-rep(1/T,T)
##D # generate data
##D d<-gendatLCplfm(N=I,objpar=objpar,attpar=attpar,sizepar=sizepar,maprule="conj",model=5)
##D # estimate parameters of true model
##D res<-LCplfm(data=d$data,F=2,T=2,model=5,maprule="conj")
##D 
##D 
##D # model 6
##D # generate true parameters
##D objpar<-array(runif(J*F*T),c(J,F,T))
##D attpar<-array(runif(K*F*T),c(K,F,T))
##D sizepar<-rep(1/T,T)
##D # generate data
##D d<-gendatLCplfm(N=I,objpar=objpar,attpar=attpar,sizepar=sizepar,maprule="conj",model=6)
##D # estimate parameters of true model
##D res<-LCplfm(data=d$data,F=2,T=2,model=6,maprule="conj")
## End(Not run)



