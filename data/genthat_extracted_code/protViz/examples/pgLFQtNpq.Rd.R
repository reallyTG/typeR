library(protViz)


### Name: pgLFQtNpq
### Title: Label Free Quantification using the top N peptide approach
### Aliases: pgLFQtNpq tNpq

### ** Examples


    data(pgLFQfeature)
    par(mfrow=c(2,4), mar=c(4,4,4,1))
    for (i in c(1, 2, 3, 4)){
        tNpq<-pgLFQtNpq(QuantitativeValue=pgLFQfeature$"Normalized abundance",
            peptide=pgLFQfeature$peptideInfo$Sequence,
            protein=pgLFQfeature$peptideInfo$Protein, 
            N=i)
    }

    for (i in c(1, 2, 3, 4)){
        tNpq<-pgLFQtNpq(QuantitativeValue=pgLFQfeature$"Normalized abundance",
            peptide=pgLFQfeature$peptideInfo$Sequence,
            protein=pgLFQfeature$peptideInfo$Protein, 
            plot=FALSE,
            N=i)

        boxplot(t(tNpq), xlab='proteins', ylab='protein value')
    }



