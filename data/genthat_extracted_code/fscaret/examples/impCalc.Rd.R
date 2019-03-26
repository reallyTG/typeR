library(fscaret)


### Name: impCalc
### Title: impCalc
### Aliases: impCalc
### Keywords: design models

### ** Examples


## Not run: 
##D # 
##D # Hashed to comply with new CRAN check
##D # 
##D library(fscaret)
##D 
##D # Load dataset
##D data(dataset.train)
##D data(dataset.test)
##D 
##D # Make objects
##D trainDF <- dataset.train
##D testDF <- dataset.test
##D model <- c("lm","Cubist")
##D fitControl <- trainControl(method = "boot", returnResamp = "all") 
##D myTimeLimit <- 5
##D no.cores <- 2
##D supress.output <- TRUE
##D skel_outfile <- paste("_default_",sep="")
##D mySystem <- .Platform$OS.type
##D with.labels <- TRUE
##D redPred <- TRUE
##D classPred <- FALSE
##D saveModel <- FALSE
##D lvlScale <- FALSE
##D 
##D if(mySystem=="windows"){
##D no.cores <- 1
##D }
##D 
##D # Scan dimensions of trainDF [lk_row x lk_col]
##D lk_col = ncol(trainDF)
##D lk_row = nrow(trainDF)
##D 
##D # Read labels of trainDF
##D labelsFrame <- as.data.frame(colnames(trainDF))
##D labelsFrame <-cbind(c(1:ncol(trainDF)),labelsFrame)
##D # Create a train data set matrix
##D trainMatryca_nr <- matrix(data=NA,nrow=lk_row,ncol=lk_col)
##D 
##D row=0
##D col=0
##D 
##D for(col in 1:(lk_col)) {
##D    for(row in 1:(lk_row)) {
##D      trainMatryca_nr[row,col] <- (as.numeric(trainDF[row,col]))
##D     }
##D }
##D 
##D # Pointing standard data set train
##D xTrain <- data.frame(trainMatryca_nr[,-lk_col])
##D yTrain <- as.vector(trainMatryca_nr[,lk_col])
##D 
##D 
##D #--------Scan dimensions of trainDataFrame1 [lk_row x lk_col]
##D lk_col_test = ncol(testDF)
##D lk_row_test = nrow(testDF)
##D 
##D testMatryca_nr <- matrix(data=NA,nrow=lk_row_test,ncol=lk_col_test)
##D 
##D row=0
##D col=0
##D 
##D for(col in 1:(lk_col_test)) {
##D    for(row in 1:(lk_row_test)) {
##D      testMatryca_nr[row,col] <- (as.numeric(testDF[row,col]))
##D     }
##D }
##D 
##D # Pointing standard data set test
##D xTest <- data.frame(testMatryca_nr[,-lk_col])
##D yTest <- as.vector(testMatryca_nr[,lk_col])
##D 
##D 
##D # Calling low-level function to create models to calculate on
##D myVarImp <- regVarImp(model, xTrain, yTrain, xTest,
##D 	    fitControl, myTimeLimit, no.cores, lk_col,
##D 	    supress.output, mySystem)
##D 
##D 
##D myImpCalc <- impCalc(skel_outfile, xTest, yTest,
##D               lk_col,labelsFrame,with.labels,redPred,classPred,saveModel,lvlScale)
##D 
## End(Not run)




