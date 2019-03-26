library(TraMineRextras)


### Name: seqplot.tentrop
### Title: Plotting superposed transversal-entropy curves
### Aliases: seqplot.tentrop seqplot.tentrop.m
### Keywords: Plot Transversal characteristics

### ** Examples

## Using the biofam data which has sequences from
## ages 15 to 30 years in columns 10 to 25
data(biofam)
biofam <- biofam[1:200,]
biofam.seq <- seqdef(biofam[,10:25], xtlab=as.character(15:30), xtstep=3)

## Plotting transversal entropies by sex
seqplot.tentrop(biofam.seq, group=biofam$sex, legend.pos="bottomright")

## Plotting transversal entropies for women
## by father's social status
group <- biofam$cspfaj[biofam$sex=="woman"]
seqplot.tentrop(biofam.seq[biofam$sex=="woman",], group=group,
    main="Women, by father's social status", legend.pos="bottomright")




