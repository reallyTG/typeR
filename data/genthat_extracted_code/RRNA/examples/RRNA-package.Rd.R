library(RRNA)


### Name: RRNA-package
### Title: RNA secondary structure ploting
### Aliases: RRNA-package RRNA
### Keywords: package

### ** Examples

### Create a CT file from bracket notation
ct=makeCt("(((...(((...)))...(((...)))...)))","AAAUUUCCCAAAGGGUUUAAAGGGUUUCCCUUU")
coord=ct2coord(ct)
RNAPlot(coord,hl=c("GGGUUU","AAAUUU"),seqcols=c(2,4),labTF=TRUE)



