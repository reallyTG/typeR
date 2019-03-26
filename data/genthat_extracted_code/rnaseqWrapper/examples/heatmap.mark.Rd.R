library(rnaseqWrapper)


### Name: heatmap.mark
### Title: Enhanced Heat Map, further modified
### Aliases: heatmap.mark
### Keywords: hplot

### ** Examples

## Below are examples of the changes made from heatmap.2()
##  for more complete examples of all this code can do
##  see ?heatmap.2

######################################
## Read in and prepare data to plot ##
######################################

## Find where the data is stored (or use your own)
pathToData <- try(system.file("",package="rnaseqWrapper",mustWork=TRUE))

if(class(pathToData) != "try-error"){
## Make sure the data were found before proceeding

## Read in the data
## Note, the files here are compressed,
##  but yours do not need to be
countData <- mergeCountFiles(paste(pathToData,"/data/",sep=""),".genes.results.txt.gz")

## limit to count data for 50 rows
## note that these are not, necessarily DE genes
toPlot <- countData[51:100,grep(".expected_count",names(countData))]

## Trim the names to make the plots a bit nicer:
names(toPlot) <- gsub(".expected_count","", names(toPlot))

#################
## Simple plot ##
#################

heatmap.mark(as.matrix(toPlot),cexCol = 0.75,labRow = FALSE)


#########################################
## More complex, add labels and legend ##
#########################################

myLabelColors <- rep(c("red","blue"),each = dim(toPlot)[2]/2)

heatmap.mark(as.matrix(toPlot),
             cexCol = 0.75,labRow = FALSE,
             scaleLabel = "",
             ColSideColors = myLabelColors)

par(xpd=TRUE) ## To allow legend on top of other stuff
legend(x="topleft",inset=c(-.02,.08), 
       bty="n", cex=.8, 
       legend= c("Female","Male"), 
       fill=unique(myLabelColors), 
       title="Sex") 
par(xpd=FALSE) ## To reset




##########################
## With multiple panels ##
##########################

## Set your own layout
## Note, that each heatmap plots 4 objects when no color labels are included
## So the offset for each additional one needs to b 4 + the options
## If you use row or column labels, additional plots are drawn
## In addition, you will likely want to play with the widths and 
## heights of each element.

baseLayout <- matrix(c(4,3,2,1), nrow = 2, byrow = TRUE)

layout(cbind(baseLayout,baseLayout + 4), 
       widths = c(1,2,1,2), heights = c(1,2), respect = FALSE)

heatmap.mark(as.matrix(toPlot),
             cexCol = 0.75,labRow = FALSE,
             scaleLabel = "",
             plotNew = FALSE)

heatmap.mark(as.matrix(toPlot),
             cexCol = 0.75,labRow = FALSE,
             scaleLabel = "",
             plotNew = FALSE)



}


 



