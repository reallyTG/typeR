library(GraphPCA)


### Name: PrepHistogram
### Title: This function transform standard variables into histogram-valued
###   variable (PrepHistogram)
### Aliases: PrepHistogram

### ** Examples


###  example1 from iris data

## preparation of histogram-valued variables (k= 3 bins)

Sepal.LengthHistogram=PrepHistogram(X=iris[,1],Z=iris[,5])$Vhistogram
Sepal.WidthHistogram=PrepHistogram(X=iris[,2],Z=iris[,5])$Vhistogram
Petal.LengthHistogram=PrepHistogram(X=iris[,3],Z=iris[,5])$Vhistogram
Petal.WidthHistogram=PrepHistogram(X=iris[,4],Z=iris[,5])$Vhistogram

############################     Hitsogram PCA   #################################
HistPCA(Variable=list(Sepal.LengthHistogram,Sepal.WidthHistogram,
        Petal.LengthHistogram,Petal.WidthHistogram),
        Row.names=names(table(iris[,5])),
		Col.names=colnames(iris)[1:4])


###  example2 from iris data

## preparation of histogram-valued variables (k= 4 bins)

Sepal.LengthHistogram=PrepHistogram(X=iris[,1],Z=iris[,5],k=2)$Vhistogram
Sepal.WidthHistogram=PrepHistogram(X=iris[,2],Z=iris[,5],k=2)$Vhistogram
Petal.LengthHistogram=PrepHistogram(X=iris[,3],Z=iris[,5],k=2)$Vhistogram
Petal.WidthHistogram=PrepHistogram(X=iris[,4],Z=iris[,5],k=2)$Vhistogram


############################     Hitsogram PCA   #################################

HistPCA(Variable=list(Sepal.LengthHistogram,Sepal.WidthHistogram,
Petal.LengthHistogram,Petal.WidthHistogram),
Row.names=names(table(iris[,5])),Col.names=colnames(iris)[1:4])



