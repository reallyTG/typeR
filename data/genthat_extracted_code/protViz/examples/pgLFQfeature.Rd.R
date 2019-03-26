library(protViz)


### Name: pgLFQfeature
### Title: pgLFQfeature - A data set with a featuremap export
###   ProgenesisLCMS
### Aliases: pgLFQfeature
### Keywords: datasets

### ** Examples

data(pgLFQfeature)
op<-par(mfrow=c(1,1),mar=c(18,18,4,1),cex=0.5)
samples<-names(pgLFQfeature$"Normalized abundance")
image(cor(asinh(pgLFQfeature$"Normalized abundance")),
    col=gray(seq(0,1,length=20)),
    main='pgLFQfeature correlation',
    axes=FALSE)

axis(1,at=seq(from=0, to=1, 
    length.out=length(samples)), 
    labels=samples, las=2)

axis(2,at=seq(from=0, to=1, 
    length.out=length(samples)), labels=samples, las=2)
par(op)

# example assemble (and quantify) all proteins from peptides 
# using intensities from the master(feature) map
# 1239 features
pgLFQfeature$peptideInfo$Sequence[1239]
pgLFQfeature$peptideInfo$Protein[1239]
# conflicts can be produced through: 
# 1. shared peptides, 
# 2. mapping to more than one peptide, 
# 3. rank two above threshold
pgLFQfeature$output$Included[1239]
pgLFQfeature$"Normalized abundance"[1239,]

# tNpq
    par(mfrow=c(4,3), mar=c(1,1,4,1))
    for (i in 1:12)
        pgLFQtNpq(QuantitativeValue=pgLFQfeature$"Normalized abundance", 
        peptide=pgLFQfeature$peptideInfo$Sequence, 
        protein=pgLFQfeature$peptideInfo$Protein, N=i)




