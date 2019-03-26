library(protViz)


### Name: pgLFQaov
### Title: iTRAQ two group analysis
### Aliases: pgLFQaov

### ** Examples


    data(pgLFQprot)

    par(mfrow=c(4,3))
    ANOVA<-pgLFQaov(pgLFQprot$"Normalized abundance",
        groups=as.factor(pgLFQprot$grouping),
        names=pgLFQprot$output$Accession,
        plot=TRUE)
    ANOVA





