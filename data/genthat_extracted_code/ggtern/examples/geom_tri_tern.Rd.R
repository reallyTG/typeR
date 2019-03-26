library(ggtern)


### Name: geom_tri_tern
### Title: Tribin (ggtern version).
### Aliases: geom_tri_tern stat_tri_tern StatTriTern
### Keywords: datasets

### ** Examples

set.seed(1)
n  = 1000
df = data.frame(x  = runif(n),
                y  = runif(n),
                z  = runif(n),
                wt = runif(n))
#Equivalent of Hexbin
ggtern(df,aes(x,y,z)) + 
   geom_tri_tern(bins=10,aes(fill=..count..)) + 
   geom_point(size=0.25)

#Custom Function, Mean
ggtern(df,aes(x,y,z)) + 
   geom_tri_tern(bins=5,aes(fill=..stat..,value=wt),fun=mean) + 
   geom_point(size=0.25)



