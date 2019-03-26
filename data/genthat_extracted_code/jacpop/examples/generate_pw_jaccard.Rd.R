library(jacpop)


### Name: generate_pw_jaccard
### Title: Calculate pairwise Jaccard similarity matrix
### Aliases: generate_pw_jaccard

### ** Examples

#####1)Toy example
#Simulate genotypes in 2 populations
nsnps=10000
fst=0.01
nind=20
maffilter=0.05
p<-runif(nsnps,0,maffilter)
freq1<-sapply(1:length(p),function(x) rbeta(1,p[x]*(1-fst)/fst,(1-p[x])*(1-fst)/fst))
freq2<-sapply(1:length(p),function(x) rbeta(1,p[x]*(1-fst)/fst,(1-p[x])*(1-fst)/fst))

pop1<-sapply(1:nsnps, function(x) sample(c(0,1,2),nind,replace=TRUE,
 prob=c(((1-freq1[x])^2),(2*freq1[x]*(1-freq1[x])),(freq1[x]^2))))
pop2<-sapply(1:nsnps, function(x) sample(c(0,1,2),nind,replace=TRUE,
 prob=c(((1-freq2[x])^2),(2*freq2[x]*(1-freq2[x])),(freq2[x]^2))))
all<-as.matrix(rbind(pop1,pop2))

#Generate the Jaccard similarity index and plot the first 2 principal components
res<-generate_pw_jaccard(geno=all,pop.label=c(rep(1,nind),rep(2,nind)))
## Not run: 
##D #####2)PLINK files
##D #If you are working with plink files after filtering the dataset consider
##D #to create a genotype count file by using the option --recodeA.
##D #After that remove the first row and the first 6 columns. Now you can
##D # read it in in the following way:
##D geno<-matrix(scan('sample.geno'),nrow=nind,byrow=T)
##D # nind is the number of individuals(rows)
## End(Not run)



