library(Rankcluster)


### Name: criteria
### Title: criteria estimation
### Aliases: criteria

### ** Examples

data(big4)
res=rankclust(big4$data,m=big4$m,K=2,Ql=100,Bl=50,maxTry=2)
if(res@convergence)
	crit=criteria(big4$data,res[2]@proportion,res[2]@pi,res[2]@mu,big4$m,Ql=200,Bl=100)



