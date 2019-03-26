library(LCAextend)


### Name: weight.nuc
### Title: performs the computation of unnormalized triplet and individuals
###   weights for a nuclear family in the pedigree
### Aliases: weight.nuc

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
#the first nuclear family
generat <- peel$generation
connect <- peel$peel.connect[generat,]
connect <- connect[connect>0]
spouse.connect <- peel$couple[peel$couple[,1]==connect,2]
children.connect <- union(id[dad==connect],id[mom==connect])
#probs and param
data(probs)
data(param.cont)
#densities of the observations
fyc <- matrix(1,nrow=length(id),ncol=length(probs$p)+1)
fyc[status==2,1:length(probs$p)] <- t(apply(y[status==2,],1,dens.norm,
                                            param.cont,NULL))
#triplet and individual weights
ww <- array(0,dim=c(length(id),rep(2,3),rep(length(probs$p)+1,3)))
w <- array(0,dim=c(length(id),2,length(probs$p)+1))
#probability of the observations below
p.ybarF.c <- array(1,dim=c(length(id),2,length(probs$p)+1))
p.ybarF.c[connect,,] <- p.post.found(connect,status,probs,fyc)
#the upward step
res.upward <- upward(id,dad,mom,status,probs,fyc,peel)
#the function
weight.nuc(connect,spouse.connect,children.connect,status,probs,fyc,
           p.ybarF.c,ww,w,res.upward)



