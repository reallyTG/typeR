library(LCAextend)


### Name: downward.connect
### Title: performs a downward step for a connector
### Aliases: downward.connect

### ** Examples

#data
data(ped.cont)
data(peel)
fam <- ped.cont[,1]
id <- ped.cont[fam==1,2]
dad <- ped.cont[fam==1,3]
mom <- ped.cont[fam==1,4]
status <- ped.cont[fam==1,6]
y <- ped.cont[fam==1,7:ncol(ped.cont)]
peel <- peel[[1]]
#standardize id to be 1, 2, 3, ...
id.origin <- id
standard <- function(vec) ifelse(vec%in%id.origin,which(id.origin==vec),0)
id <- apply(t(id),2,standard)
dad <- apply(t(dad),2,standard)
mom <- apply(t(mom),2,standard)
peel$couple <- cbind(apply(t(peel$couple[,1]),2,standard),
                     apply(t(peel$couple[,2]),2,standard))
for(generat in 1:peel$generation) 
peel$peel.connect[generat,] <- apply(t(peel$peel.connect[generat,]),2,standard)
#the 2nd connector
generat <- peel$generation-1
connect <- peel$peel.connect[generat,]
connect <- connect[connect>0][1]
parent1.connect <- intersect(peel$peel.connect[generat+1,],c(dad[id==connect],
                                                             mom[id==connect]))
parent2.connect <- setdiff(c(dad[id==connect],mom[id==connect]),parent1.connect)
bro.connect <- union(id[dad==parent1.connect],id[mom==parent1.connect])
bro.connect <- setdiff(bro.connect,connect)
#probs and param
data(probs)
data(param.cont)
#densities of the observations
fyc <- matrix(1,nrow=length(id),ncol=length(probs$p)+1)
fyc[status==2,1:length(probs$p)] <- t(apply(y[status==2,],1,dens.norm,param.cont,NULL))
#probability of the observations below
p.ybarF.c <- array(1,dim=c(length(id),2,length(probs$p)+1))
#the upward step
res.upward <- upward(id,dad,mom,status,probs,fyc,peel)
#the function
downward.connect(connect,parent1.connect,parent2.connect,bro.connect,status,
                 probs,fyc,p.ybarF.c,res.upward)



