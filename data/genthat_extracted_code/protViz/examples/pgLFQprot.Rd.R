library(protViz)


### Name: pgLFQprot
### Title: pgLFQprot - A data set with a featuremap export ProgenesisLCMS
### Aliases: pgLFQprot
### Keywords: datasets

### ** Examples


data(pgLFQprot)
op<-par(mfrow=c(1,1),mar=c(18,18,4,1),cex=0.5)
samples<-names(pgLFQprot$"Normalized abundance")
image(cor(asinh(pgLFQprot$"Normalized abundance")),
    main='pgLFQprot correlation',
    axes=FALSE,
    col=gray(seq(0,1,length=20)))
axis(1,at=seq(from=0, to=1, 
    length.out=length(samples)), labels=samples, las=2)
axis(2,at=seq(from=0, to=1, 
    length.out=length(samples)), labels=samples, las=2)
par(op)




