library(haplotypes)


### Name: plot-methods
### Title: Methods for function 'plot' in the package 'haplotypes'
### Aliases: plot-methods plot,Parsimnet-method
### Keywords: STATISTICAL PARSIMONY

### ** Examples

data("dna.obj")
x<-dna.obj

## Statistical parsimony with %95 connection limit 
p<-parsimnet(x) 
p

## Plotting with default parameters.
plot(p)

## Displaying vertex labels of intermediate haplotypes.
plot(p, inter.labels=TRUE)

## Not run: 
##D  
##D ## Interactively adjusting vertex positions.
##D plot(p, interactive=TRUE)
## End(Not run)
 
## Adjusting vertex sizes.
plot(p, vertex.cex=c(rep(3,nrow(p@d[[1]]))))

# different sizes for haplotypes and intermediates
plot(p, vertex.cex=c(rep(3,p@nhap),rep(1,c(nrow(p@d[[1]])-p@nhap))))  

## Statistical parsimony with %98 connection limit.
p<-parsimnet(x,prob=.98) 
p

#plot the first network
plot(p,net=1)

#plot the second network
plot(p,net=2)

#plot the third network. It is a single vertex.
plot(p,net=3) 



