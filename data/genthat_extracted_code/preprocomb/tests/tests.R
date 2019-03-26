
library(preprocomb)

modifiediris <- droplevels(iris[-c(1:60),])

## Test DataClass
testdataobject <- initializedataclassobject(modifiediris)
expect_is(testdataobject, "DataClass")
expect_true(all(testdataobject@variance==TRUE, testdataobject@finite==TRUE, testdataobject@completeobs==TRUE, testdataobject@classbalance==TRUE, testdataobject@ntopratiotwoplus==TRUE, testdataobject@mindimensions==TRUE))

## PhaseClass

expect_error(testphase_error <- setphase("testphase_error", "something", preimpute=TRUE))
testphase_success <- setphase("testphase_success", "naomit", preimpute=TRUE)
expect_is(testphase_success, "PhaseClass")

## PreprocessorClass

numpreproccessors <- paste("List of", length(getpreprocessor()))
expect_output(str(testpreprocessors(data=modifiediris)), numpreproccessors)

## GridClass
testgrid <- setgrid(phases=c("outliers"), data=modifiediris)
expect_is(testgrid, "GridClass")



