library(RRNA)


### Name: alignCoord
### Title: Alignment of secondary structure folds to 2 nucleotides.
### Aliases: alignCoord
### Keywords: align rna

### ** Examples

### Create two RNA secondary structures ####
ct1=makeCt(
           "((((...(((((((....)))))))...((((...))))...))))",
           "CCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC" 
          )
ct2=makeCt(
           "((((...(((((((....))))))).((..((...))))...))))",
           "CCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC" 
          )

### Create a coordinate file ####
dat1=ct2coord(ct1)

### Each RNA fold needs its own id ###
dat1$id=1

#### Create a coordinate file ####
dat2=ct2coord(ct2)
### Each RNA fold needs its own id ###
dat2$id=2

dat=rbind(dat1,dat2)

adat=alignCoord(dat,1,46,0,0)

### Plot the aligned RNA folds ####
RNAPlot(adat[adat$id==1,])
l=length(adat$seq[adat$id==2])
RNAPlot(adat[adat$id==2,],modspec=TRUE,modp=c(1:l),modcol=rep(4,l),mod=rep(16,l),add=TRUE)




