library(RRNA)


### Name: RNAPlot
### Title: Generic RNA Secondary Structure Plotting Function
### Aliases: RNAPlot
### Keywords: rna rnaplot

### ** Examples


## Create a CT file from bracket notation and sequence ###
ct=makeCt( "((((...(((((((....)))))))...((((...))))...))))",
          "CCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC"
)

## Create a coordinate file based on the CT file ###
dat=ct2coord(ct)

### Create a plot of the secondary structure ###
RNAPlot(dat)

### Plot positions 1:4 as green and 43:46 circles ## 
### and show the legend
ranges=data.frame(min=c(1,43),max=c(4,46),col=c(2,3),
                  desc=c("Region 1","Region 2")
                 )
RNAPlot(dat,ranges,labTF=TRUE)

### Highlight the sequences CUCCU and CCCCAAA ###

RNAPlot(dat,hl=c("CUCCU","CCCCAAA"),seqcol=c(2,4),labTF=TRUE,main="RNA Molecule")

### Modify specific positions ####

RNAPlot( dat, modspec=TRUE, modp=c(1:4,43:46),mod=c(17,17,15,15,16,16,16,16),
         modcol=c(rep(2,2),rep(3,2),rep(4,4))
       )

### RNA Plot with nucleotides ###
RNAPlot(dat,nt=TRUE)

### RNA plot with nucleotides
RNAPlot( dat,nt=TRUE,modspec=TRUE,modp=c(1:4,43:46),
         mod=c(17,17,15,15,16,16,16,16),
         modcol=c(rep(2,2),rep(3,2),rep(4,4))
       )

### RNA Plot wiht nucleotides and dots ###

RNAPlot(dat)
RNAPlot(dat,nt=TRUE,add=TRUE,dp=0.75)



