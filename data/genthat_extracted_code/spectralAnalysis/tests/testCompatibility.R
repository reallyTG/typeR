# Project: spectralAnalysis-R-package
# 
# Author: ablommaert
###############################################################################


context( "Compatibility test error messages " )

## data generation

x  = getSpectraInTimeExample()
y  = getProcessTimesExample()




# wrong experiment name 
xNameDif            <-  x
xNameDif@experimentName <-  "verkeerde naam"

# wrong startime  name 
xTimeDiff            <-  x
xTimeDiff@startTime  <-  getStartTime( x ) + 100000

# NA start time: warning instead of error

xTimeNA            <-  x
xTimeNA@startTime  <-  getStartTime( x ) + NA


test_that( "compatibility testing spectraInTime and processTimes" , {
    expect_equal( checkCompatible(  x , y) , checkCompatible( y , x ) )
    expect_error( checkCompatible( xNameDif , y )  )
    expect_error( checkCompatible( xTimeDiff , y ) )
    expect_warning( checkCompatible( xTimeNA , y )  )
  }
)
