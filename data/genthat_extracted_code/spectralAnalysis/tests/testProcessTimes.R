# Project: spectralAnalysis-R-package
# 
# Author: ablommaert
###############################################################################


context( " ProcessTimes S4 class" )

baseObject                <-  getProcessTimesExample()
baseObjectWrongHeating    <-  baseObject
baseObjectWrongHeating@timeHeatingAboveMin    <-  baseObject@timeHeatingAboveMin +  2.1*60*60


baseObjectWrongEnd         <-  baseObject
baseObjectWrongEnd@timeEndProcess         <-  baseObject@timeEndProcess - 100000



test_that( "Validity ProcessTimes working" , {
    expect_error( validObject( baseObjectWrongHeating ) )
    expect_error( validObject( baseObjectWrongEnd ) )
  }
)
