myData <- as.data.frame(matrix(1:30,ncol=3,nrow=10))
names(myData) <- c('ID','t','y')
myData$ID <- c(1,1,1,2,2,2,3,3,3,3)
mFormula <-'b0'
cFormula <- '(t==t#)*sigma'
ID <- 'ID'
DV <- 'y'

myDataLong <- structure(myData,class=c('LongData',class(myData)),ID=ID,DV=DV)
controls <- gppmControl(stanModel = FALSE)
