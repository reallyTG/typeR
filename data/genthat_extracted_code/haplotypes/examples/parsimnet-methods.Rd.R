library(haplotypes)


### Name: parsimnet-methods
### Title: Estimates gene genealogies using statistical parsimony
### Aliases: parsimnet parsimnet-methods parsimnet,dist-method
###   parsimnet,Dna-method parsimnet,matrix-method
### Keywords: STATISTICAL PARSIMONY

### ** Examples

data("dna.obj")
x<-dna.obj

## Method for signature 'Dna'.
# statistical parsimony with %95 connection limit 
p<-parsimnet(x) 
p
plot(p)

# statistical parsimony with %99 connection limit 
p<-parsimnet(x,prob=.99) 
p
# plot the first network
plot(p,net=1) 

# statistical parsimony with %95 connection limit, indels are coded as missing
p<-parsimnet(x,indels="m")
p
plot(p)


## Method for signature 'dist'.
d<-distance(x)
seqlength<-length(x)
# statistical parsimony with %95 connection limit for 113 character
p<-parsimnet(d,seqlength) 
p
plot(p)


## Method for signature 'matrix'.
d<-as.matrix(distance(x))
seqlength<-length(x)
# statistical parsimony with %95 connection limit for 113 character
p<-parsimnet(d,seqlength)
p
plot(p)




