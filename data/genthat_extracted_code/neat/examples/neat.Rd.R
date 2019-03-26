library(neat)


### Name: neat
### Title: Performs neat for lists of gene sets
### Aliases: neat pvalue neatc
### Keywords: htest

### ** Examples

# Example 1: network given as adjacency matrix:
A = matrix(0, nrow=7, ncol=7)
A[1,c(2,3)]=1; A[2,c(5,7)]=1;A[3,c(1,4)]=1;A[4,c(2,5,7)]=1;A[6,c(2,5)]=1;A[7,4]=1
labels = letters[1:7]
set1 = c('a','e')
set2 = c('c','g')
set3 = c('d','f')
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3)

test1 = neat(alist = alist, blist = blist, network=A, 
             nettype='directed', nodes=labels, alpha=0.05)
print(test1)

# Example 2: network given as igraph object:
library(igraph)
network = erdos.renyi.game(15, 1/3)
set1 = 1:4
set2 = c(2,5,13)
set3 = c(3,9,14)
set4 = c(8,15,20)
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3, 'set 4' = set4)

test2 = neat(alist, blist, network = network, 
             nettype='undirected', nodes=seq(1,15), alpha=NULL)
print(test2)

# Example 3: network given as list of links:
networklist = matrix(nrow=13, ncol=2)
networklist[,1]=c('a','a','b','b','c','d','d','d','f','f','f','h','h')
networklist[,2]=c('d','e','e','g','d','b','e','g','a','b','e','c','g')

labels = letters[1:8]
set1 = c('a','b','e')
set2 = c('c','g')
set3 = c('d','f')
set4 = c('a','b','f')
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3, 'set4' = set4)

test3 = neat(alist, blist, network = networklist, 
             nettype = 'undirected', nodes=labels, alpha=0.05)
print(test3)

alist = list('set 1' = set1, 'set 2' = set2, 'set 3' = set3)
test4 = neat(alist, network = networklist, 
             nettype = 'undirected', nodes=labels, alpha=0.05)
print(test4)

# Example 4: ESR data
## Not run: 
##D data(yeast)
##D esr = list('ESR 1' = yeast$esr1, 'ESR 2' = yeast$esr2)
##D test = neat(alist = esr, blist = yeast$goslimproc, network = yeast$yeastnet,
##D             nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
##D # Replace with "blist = yeast$kegg" to use kegg pathways
##D 
##D m = dim(test)[1]
##D test1 = test[1:(m/2),]
##D table(test1$conclusion)
##D plot(test1)
##D o1=test1[test1$conclusion=='Overenrichment',]
##D print(o1, nrows='ALL') #display overenrichments
##D 
##D test2 = test[(m/2+1):m,]
##D table(test2$conclusion)
##D plot(test2)
##D o2=test2[test2$conclusion=='Overenrichment',]
##D print(o2, nrows='ALL') #display overenrichments
## End(Not run)


