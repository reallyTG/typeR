library(protViz)


### Name: fragmentIon
### Title: Compute the b and y Fragment Ions of a Peptide Sequence
### Aliases: fragmentIon as.data.frame.fragmentIonSet bymatrix ionseries
###   defaultIon

### ** Examples


# Example 1
peptide.AA<-"KINHSFLR";

peptide.AA.weights <- c(128.09496,113.08406,114.04293,
    137.05891,87.03203,147.06841,113.08406,156.10111);

fragmentIon(peptide.AA);

fragmentIon(peptide.AA.weights);

HCD_Ion <- function(b, y){
    return(cbind(b = b, y = y))
}


ETD_Ion <- function(b, y){
    Hydrogen <- 1.007825
    Oxygen <- 15.994915
    Nitrogen <- 14.003074

    y_0 <- y - Oxygen - Hydrogen - Hydrogen
    c <- b + (Nitrogen + (3 * Hydrogen))
    z <- y - (Nitrogen + (3 * Hydrogen))

    return(cbind(y_0, c, z))
}

fragmentIon(peptide.AA, FUN = ETD_Ion)
        
peptides<-c('HTLNQIDSVK', 'ALGGEDVR', 'TPIVGQPSIPGGPVR')

pim <- parentIonMass(peptides)
fi <- fragmentIon(peptides)
(df <- as.data.frame(fi))

op <- par(mfrow=c(3,1)); 
for (i in 1:length(peptides)){
    plot(0, 0,
    xlab='m/Z',
    ylab='',
    xlim=range(c(fi[[i]]$b,fi[[i]]$y)),
    ylim=c(0,1),
    type='n',
    axes=FALSE,
    sub=paste(peptides[i], "/", pim[i], "Da"));
    box()
    axis(1, fi[[i]]$b, round(fi[[i]]$b,1), las=2)
    axis(1, fi[[i]]$y, round(fi[[i]]$y,1), las=2)

    pepSeq<-strsplit(peptides[i], "")
    axis(3,fi[[i]]$b, paste("b", row.names(fi[[i]]),sep=''),las=2)
    axis(3,fi[[i]]$y, paste("y", row.names(fi[[i]]),sep=''),las=2)

    text(fi[[i]]$b, rep(0.3, nchar(peptides[i])), 
    pepSeq[[1]],pos=3,cex=4, lwd=4, col="#aaaaaaaa")

    abline(v=fi[[i]]$b, col='red') 
    abline(v=fi[[i]]$y, col='blue',lwd=2)
}
par(op)


fi <- fragmentIon(c("ATSFYK","XGXFNAGVGK"))[[2]]
fi$b[1] + fi$y[9]
fi$b[2] + fi$y[8]


ION2C <- function(b, y){
    Hydrogen <- 1.007825
    Oxygen <- 15.994915
    Nitrogen <- 14.003074

    #yo <- fi$y - Oxygen - Hydrogen - Hydrogen
    c <- b + (Nitrogen + (3 * Hydrogen))
    z <- y - (Nitrogen + (3 * Hydrogen))
    
    b2 <- (b + Hydrogen) / 2
    y2 <- (y + Hydrogen) / 2

    return(cbind(b, y, b2 ,y2))
}





