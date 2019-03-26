library(Publish)


### Name: plotConfidence
### Title: Plot confidence intervals
### Aliases: plotConfidence

### ** Examples


library(Publish)
data(CiTable) 

## A first draft version of the plot is obtained as follows
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper","p")],
          labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")])

## if argument labels is a named list the table is subdivided:
labellist <- split(CiTable[,c("Dose","Mean","SD","n")],CiTable[,"Drug"])
labellist
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")], labels=labellist)


## The graph consist of at most three columns:
##
## column 1: labels
## column 2: printed values of the confidence intervals
## column 3: graphical presentation of the confidence intervals
##
## NOTE: column 3 appears always, the user decides if also
##       column 1, 2 should appear
##
## The columns are arranged with the function layout
## and the default order is 1,3,2 such that the graphical
## display of the confidence intervals appears in the middle
##
## the order of appearance of the three columns can be changed as follows
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               order=c(1,3,2))
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               order=c(2,3,1))
## if there are only two columns the order is 1, 2
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               values=FALSE,
               order=c(2,1))
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               values=FALSE,
               order=c(1,2))



## The relative size of the columns needs to be controlled manually
## by using the argument xratio. If there are only two columns
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xratio=c(0.4,0.15))

## The amount of space on the left and right margin can be controlled
## as follows:
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xratio=c(0.4,0.15),
               leftmargin=0.1,rightmargin=0.00)

## The actual size of the current graphics device determines
## the size of the figures and the space between them.
## The sizes and line widths are increased as follows:
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               xlab="Hazard ratio",
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               points.cex=3,
               cex=2,
               lwd=3,
               xaxis.lwd=1.3,
               xaxis.cex=1.3)
## Note that 'cex' of axis ticks is controlled via 'par' but
## cex of the label via argument 'cex' of 'mtext'.
## The sizes and line widths are decreased as follows:
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               cex=0.8,
               lwd=0.8,
               xaxis.lwd=0.8,
               xaxis.cex=0.8)

## Another good news is that all figures can be controlled separately

## The size of the graphic device can be controlled in the usual way, e.g.:
## Not run: 
##D     pdf("~/tmp/testCI.pdf",width=8,height=8)
##D     plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
##D                    labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")])
##D     dev.off()
## End(Not run)

## More control of the x-axis and confidence intervals that
## stretch outside the x-range end in an arrow. 
## the argument xlab.line adjusts the distance of the x-axis
## label from the graph
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               xlab="Hazard ratio",
               xlab.line=1.8,
               xaxis.at=c(0.8,1,1.3),
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xlim=c(0.8,1.3))

## log-scale
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               xlab="Hazard ratio",
               xlab.line=1.8,
               xaxis.at=c(0.8,1,1.3),
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xlim=c(0.8,1.3),plot.log="x")
## More pronounced arrows
## Coloured xlab expression
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               xlab=expression(HR[1](s)),
               xlab.line=1.8,
               xlab.col="darkred",
               extremearrows.angle=50,
               extremearrows.length=0.1,
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xlim=c(0.8,1.3))

## Controlling the labels and their titles
## and the values and their titles
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xlab="Hazard ratio",
               title.values=expression(bold(HR (CI[95]))),
               title.labels=c("Drug/Time","Dose","Mean","St.dev.","N"),
               factor.reference.pos=c(1,10,19),
               factor.reference.pch=16,
               cex=1.3,
               xaxis.at=c(0.75,1,1.25,1.5,2))

## For factor reference groups, one may want to replace the
## confidence intervals by the word Reference, as in the previous example.
## To change the word 'Reference' we use the argument factor.reference.label:
## To change the plot symbol for the reference lines factor.reference.pch
## To remove the plot symbol in the reference lines use 'NA' as follows:
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xlab="Hazard ratio",
               factor.reference.label="Ref",
               title.values=expression(bold(HR (CI[95]))),
               title.labels=c("Drug/Time","Dose","Mean","St.dev.","N"),
               factor.reference.pos=c(1,10,19),
               factor.reference.pch=NA,
               cex=1.3,
               xaxis.at=c(0.75,1,1.25,1.5,2))


## changing the style of the graphical confidence intervals
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               xlab="Hazard ratio",
               factor.reference.pos=c(1,10,19),
               points.pch=15,
               points.col=rainbow(27),
               points.cex=2,
               arrows.col="darkblue",
               cex=1.3,
               order=c(1,3,2),
               xaxis.at=c(0.75,1,1.25,1.5))

## the values column of the graph can have multiple columns as well
## to illustrate this we create the confidence intervals
## before calling the function and then cbind them
## to the pvalues
HR <- pubformat(CiTable[,6])
CI95 <- formatCI(lower=CiTable[,7],upper=CiTable[,8],format="(l-u)")
pval <- format.pval(CiTable[,9],digits=3,eps=10^{-3})
pval[pval=="NA"] <- ""
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               values=list("HR"=HR,"CI-95"=CI95,"P-value"=pval),
               cex=1.2,
               xratio=c(0.5,0.3))

## Finally, vertical columns can be delimited with background color
## NOTE: this may slow things down and potentially create
##       large figures (many bytes)
col1 <- rep(c(prodlim::dimColor("green",density=22),
              prodlim::dimColor("green")),length.out=9)
col2 <- rep(c(prodlim::dimColor("orange",density=22),
              prodlim::dimColor("orange")),length.out=9)
col3 <- rep(c(prodlim::dimColor("blue",density=22),
              prodlim::dimColor("blue")),length.out=9)
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               stripes=c(1,0,1),
               stripes.col=c(col1,col2,col3))
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               stripes=c(1,1,1),
               stripes.col=c(col1,col2,col3))

threegreens <- c(prodlim::dimColor("green",density=55),
                 prodlim::dimColor("green",density=33),
                 prodlim::dimColor("green",density=22))
plotConfidence(x=CiTable[,c("HazardRatio","lower","upper")],
               labels=CiTable[,c("Drug.Time","Dose","Mean","SD","n")],
               values=FALSE,
               xlim=c(0.75,1.5),
               stripes=c(1,1,1),
               xratio=c(0.5,0.15),
               stripes.horizontal=c(0,9,18,27)+0.5,
               stripes.col=threegreens)






