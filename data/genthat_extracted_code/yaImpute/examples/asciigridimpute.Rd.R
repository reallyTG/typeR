library(yaImpute)


### Name: AsciiGridImpute
### Title: Imputes/Predicts data for Ascii Grid maps
### Aliases: AsciiGridImpute AsciiGridPredict
### Keywords: spatial utilities

### ** Examples


## These commands write new files to your working directory

# Use the iris data
data(iris)

# Section 1: Imagine that the iris are planted in a planting bed.
# The following set of commands create Asciigrid map
# files for four attributes to illustrate the planting layout.

# Change species from a character factor to numeric (the sp classes
# can not handle character data).

sLen <- matrix(iris[,1],10,15)
sWid <- matrix(iris[,2],10,15)
pLen <- matrix(iris[,3],10,15)
pWid <- matrix(iris[,4],10,15)
spcd <- matrix(as.numeric(iris[,5]),10,15)

# Create and change to a temp directory. You can delete these steps
# if you wish to keep the files in your working directory.
curdir <- getwd()
setwd(tempdir())
cat ("Using working dir",getwd(),"\n")

# Make maps of each variable.
header = c("NCOLS 15","NROWS 10","XLLCORNER 1","YLLCORNER 1",
           "CELLSIZE 1","NODATA_VALUE -9999")
cat(file="slen.txt",header,sep="\n")
cat(file="swid.txt",header,sep="\n")
cat(file="plen.txt",header,sep="\n")
cat(file="pwid.txt",header,sep="\n")
cat(file="spcd.txt",header,sep="\n")


write.table(sLen,file="slen.txt",append=TRUE,col.names=FALSE,
            row.names=FALSE)
write.table(sWid,file="swid.txt",append=TRUE,col.names=FALSE,
            row.names=FALSE)
write.table(pLen,file="plen.txt",append=TRUE,col.names=FALSE,
            row.names=FALSE)
write.table(pWid,file="pwid.txt",append=TRUE,col.names=FALSE,
            row.names=FALSE)
write.table(spcd,file="spcd.txt",append=TRUE,col.names=FALSE,
            row.names=FALSE)

# Section 2: Create functions to predict species

# set the random number seed so that example results are consistant
# normally, leave out this command
set.seed(12345)

# sample the data
refs <- sample(rownames(iris),50)
y <- data.frame(Species=iris[refs,5],row.names=rownames(iris[refs,]))

# build a yai imputation for the reference data.
rfNN <- yai(x=iris[refs,1:4],y=y,method="randomForest")

# make lists of input and output map files.

xfiles <- list(Sepal.Length="slen.txt",Sepal.Width="swid.txt",
               Petal.Length="plen.txt",Petal.Width="pwid.txt")
outfiles1 <- list(distance="dist.txt",Species="spOutrfNN.txt",
                  useid="useindx.txt")

# map the imputation-based predictions for the input maps
AsciiGridImpute(rfNN,xfiles,outfiles1,ancillaryData=iris)
# read the asciigrids and get them ready to plot
spOrig <- t(as.matrix(read.table("spcd.txt",skip=6)))
sprfNN <- t(as.matrix(read.table("spOutrfNN.txt",skip=6)))
dist <- t(as.matrix(read.table("dist.txt",skip=6)))

# demonstrate the use of useid:
spViaUse <- read.table("useindx.txt",skip=6)
for (col in colnames(spViaUse)) spViaUse[,col]=as.character(y$Species[spViaUse[,col]])

# demonstrate how to use factors:
spViaLevels  <- read.table("spOutrfNN.txt",skip=6)
for (col in colnames(spViaLevels)) spViaLevels[,col]=levels(y$Species)[spViaLevels[,col]]

identical(spViaLevels,spViaUse)

if (require(randomForest))
{
  # build a randomForest predictor
  rf <- randomForest(x=iris[refs,1:4],y=iris[refs,5])
  AsciiGridPredict(rf,xfiles,list(predict="spOutrf.txt"))
  sprf <- t(as.matrix(read.table("spOutrf.txt",skip=6)))
} else sprf <- NULL

# reset the directory to that where the example was started.
setwd(curdir)

par(mfcol=c(2,2),mar=c(1,1,2,1))
image(spOrig,main="Original",col=c("red","green","blue"),
      axes=FALSE,useRaster=TRUE)
image(sprfNN,main="Using Impute",col=c("red","green","blue"),
      axes=FALSE,useRaster=TRUE)
if (!is.null(sprf))
  image(sprf,main="Using Predict",col=c("red","green","blue"),
      axes=FALSE,useRaster=TRUE)
image(dist,main="Neighbor Distances",col=terrain.colors(15),
      axes=FALSE,useRaster=TRUE)




