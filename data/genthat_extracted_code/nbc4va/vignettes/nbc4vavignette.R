## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  nbc4vaGUI()

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)  # load the nbc4va package
#  
#  # View this help page as a vignette
#  browseVignettes("nbc4va")
#  
#  # Access details about certain functions
#  help("nbc4va") # access the nbc4va package docs
#  help("nbc4vaGUI") # access GUI details
#  help("nbc4vaIO") # access file in and out details
#  help("nbc") # access the nbc algorithm function
#  help("summary.nbc") # access the summary function
#  help("plot.nbc") # access the results plot function
#  
#  # Access details about example data
#  help("nbc4vaData")
#  help("nbc4vaDataRaw")
#  
#  # Alternative short forms
#  ?nbc4va
#  ?nbc4vaGUI
#  ?nbc4vaIO
#  ?nbc
#  ?nbc4vaData
#  ?nbc4vaDataRaw
#  ?summary.nbc
#  ?plot.nbc

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  citation("nbc4va")

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)  # load the package
#  nbc4vaGUI()  # open the GUI in your web browser

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  
#  # Find paths to your "trainFile" and "testFile"
#  trainFile <- file.choose()  # select train file first
#  testFile <- file.choose()  # followed by test file after
#  
#  # Run NBC model
#  # Dump results to same directory as "testFile"
#  # Set "known"" to indicate whether testing causes are known
#  nbc4vaIO(trainFile, testFile, known=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  ?nbc4vaIO

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  
#  # Create training and testing dataframes
#  data(nbc4vaData)  # example data
#  train <- nbc4vaData[1:50, ]
#  test <- nbc4vaData[51:100, ]
#  
#  # Train a nbc model
#  # The "results" variable is a nbc list-like object with elements accessible by $
#  # Set "known" to indicate whether or not testing causes are known in "test"
#  results <- nbc(train, test, known=TRUE)
#  
#  # Obtain the probabilities and predictions
#  prob <- results$prob.causes  # vector of probabilities for each test case
#  pred <- results$pred.causes  # vector of top predictions for each test case
#  
#  # View the "prob" and "pred", the names are the case ids
#  head(prob)
#  head(pred)

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  ?nbc

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  
#  # Create training and testing dataframes
#  data(nbc4vaData)
#  train <- nbc4vaData[1:50, ]
#  test <- nbc4vaData[51:100, ]
#  
#  # Train a nbc model
#  results <- nbc(train, test, known=TRUE)
#  
#  # Automatically calculate metrics with summary
#  # The "brief" variable is a nbc_summary list-like object
#  # The "brief" variable is "results", but with additional metrics
#  brief <- summary(results)
#  
#  # Obtain the calculated metrics
#  metrics <- brief$metrics.all  # vector of overall metrics
#  causeMetrics <- brief$metrics.causes  # dataframe of metrics by cause
#  
#  # Access the calculatd metrics
#  metrics[["CSMFaccuracy"]]
#  metrics[["Sensitivity"]]
#  View(causeMetrics)

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  ?summary.nbc

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  
#  # Create training and testing data
#  data(nbc4vaData)
#  train <- nbc4vaData[1:50, ]
#  test <- nbc4vaData[51:100, ]
#  
#  # Train a nbc model and plot the top 5 causes if possible
#  results <- nbc(train, test, known=TRUE)
#  plot(results, top=5)
#  plot(results, top=5, footnote=FALSE)  # remove footnote

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va)
#  ?plot.nbc

## ----eval=FALSE----------------------------------------------------------
#  library(nbc4va) # load the nbc4va package
#  data(nbc4vaData) # load the example data
#  View(nbc4vaData) # view the sample data in the nbc4va package
#  data(nbc4vaDataRaw) # load the example data with unknown symptom values
#  View(nbc4vaDataRaw) # view the sample data with unknown symptom values

