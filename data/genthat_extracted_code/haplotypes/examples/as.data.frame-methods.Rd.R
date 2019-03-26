library(haplotypes)


### Name: as.data.frame-methods
### Title: Coerces a 'Dna' object to a data.frame
### Aliases: as.data.frame as.data.frame-methods as.data.frame,Dna-method
### Keywords: DNA ANALYSIS

### ** Examples


data("dna.obj")

x<-dna.obj
x<-as.dna(x[1:4,1:6])

## Coercing a 'Dna' object to a data.frame.
df<-as.data.frame(x)
df

# TRUE
is.data.frame(df) 

## Not run: 
##D # gives the same result 
##D df<-as.data.frame(x@sequence) 
##D df
## End(Not run)



