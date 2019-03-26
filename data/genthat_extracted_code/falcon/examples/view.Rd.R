library(falcon)


### Name: view
### Title: Viewing Data with Allele-specific Copy Number
### Aliases: view

### ** Examples

data(Example) 
cn = getASCN(readMatrix, tauhat=tauhat)
view(cn)

# to view the plot for only showing A-allele frequency of the case (black) sample overlayed 
# onto those of the control (gray) sample
par(mfrow=c(1,1))
view(cn, plot="Afreq")

# to view the relative depth of the case over control adjusted by the ratio of total mapped 
# reads in fixed size bins
par(mfrow=c(1,1))
view(cn, plot="RelativeCoverage")

# to view the estimated allele-specific DNA copy numbers
par(mfrow=c(1,1))
view(cn, plot="ASCN")



