# Project: spectralAnalysis-R-package
# 
# Author: Adriaan Blommaert
###############################################################################


context( "Integration and preprocessing" )




x <-  seq( 0 , 5 , 0.001)
y <-  x^2
INumeric      <-  spectralAnalysis:::trapz( x , y ) 
InumReversed  <-  spectralAnalysis:::trapz( rev(x) , rev(y) )
ITheory       <-  5^3/3 


test_that( "Consistency integration" , {
      expect_equal( INumeric ,  ITheory , tolerance = 0.00001 ) 
      expect_equal( InumReversed ,  ITheory , tolerance = 0.00001 ) 
    }
)
