library(CompareTests)


### Name: CompareTests-package
### Title: Correct for Verification Bias in Diagnostic Accuracy & Agreement
### Aliases: CompareTests-package
### Keywords: package

### ** Examples


# Get specimens dataset
data(specimens)

# Get diagnostic and agreement statistics if sampledtest is the gold standard
CompareTests(specimens$stdtest,specimens$sampledtest,specimens$stratum)

# Get diagnostic and agreement statistics if stdtest is the gold standard
CompareTests(specimens$stdtest,specimens$sampledtest,specimens$stratum,goldstd="stdtest")

# Get agreement statistics if neither test is a gold standard
CompareTests(specimens$stdtest,specimens$sampledtest,specimens$stratum,goldstd=FALSE)




