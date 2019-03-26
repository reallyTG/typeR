# Test whether different preprocessing methods yield identical results 
# 
# Author: ablommaert
###############################################################################


context("Preprocessing ")


## preprocess data
objectExample    <-   getSpectraInTimeExample()
test1  <-  normalize( objectExample ) 
test2  <-  baselineCorrect( test1 )
test3   <- smooth( test2 , derivative = 2 )



test3Bis         <-  smooth( baselineCorrect( normalize( objectExample ) ) , derivative = 2 )

test3Tris        <-  preprocess( objectExample , getPreprocessing( test3 ) ) # Not equal error here 

test3Quat        <-  preprocess( objectExample  , test3 )


test_that( "Equal result of preprocessing method" , {
      expect_equal( test3 , test3Bis )
      expect_equal( test3 , test3Tris )
      expect_equal( test3 , test3Quat )    
    }
)


identical( getSpectra(test3) , getSpectra(test3Bis) ) 
