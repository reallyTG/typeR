library(ClassDiscovery)


### Name: Mosaic
### Title: Class "Mosaic"
### Aliases: Mosaic Mosaic-class plot,Mosaic,missing-method
###   pltree,Mosaic-method summary,Mosaic-method
### Keywords: classes cluster hplot multivariate

### ** Examples

showClass("Mosaic")

## simulate data from three different sample groups
d1 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d2 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d3 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
dd <- cbind(d1, d2, d3)
kind <- factor(rep(c('red', 'green', 'blue'), each=10))

## prepare the Mosaic object
m <- Mosaic(dd,
            sampleMetric='pearson',
            geneMetric='spearman',
            center=TRUE,
            usecor=TRUE)
summary(m)

## The default plot with red-green color map
plot(m, col=redgreen(64))

## change to a blue-yellow color map, and mark the four top splits in the
## sample direction with a color bar along the top
plot(m, col=blueyellow(128), sampleClasses=4,
     sampleColors=c('red', 'green', 'blue', 'black'))

## This time, mark the three classes that we know are there
plot(m, col=blueyellow(128), sampleClasses=kind,
     sampleColors=c('red', 'green', 'blue'))

plot(m, col=blueyellow(128),
     geneClasses=3, geneColors=c('red', 'green', 'black'))

## In addition, mark the top 5 splits in the gene dendrogram
plot(m,
     col=blueyellow(128),
     sampleClasses=kind,
     sampleColors=c('red', 'green', 'black'),
     geneClasses=5,
     geneColors=c('cyan', 'magenta', 'royalblue', 'darkgreen', 'orange'))

## plot the sample dendrogram by itself
cols <- as.character(kind)
pltree(m, labels=1:30, colors=cols)

## cleanup
rm(d1, d2, d3, dd, kind, cols, m)



