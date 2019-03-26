library(vcdExtra)


### Name: Geissler
### Title: Geissler's Data on the Human Sex Ratio
### Aliases: Geissler
### Keywords: datasets

### ** Examples

data(Geissler)
## maybe str(Geissler) ; plot(Geissler) ...

# reproduce Saxony data, families of size 12
Saxony12<-subset(Geissler, size==12, select=c(boys, Freq))
rownames(Saxony12)<-NULL

# make a 1-way table
xtabs(Freq~boys, Saxony12)

# extract data for other family sizes
Saxony11<-subset(Geissler, size==11, select=c(boys, Freq))
rownames(Saxony11)<-NULL
Saxony10<-subset(Geissler, size==10, select=c(boys, Freq))
rownames(Saxony10)<-NULL




