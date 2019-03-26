#' test-na.true.R

context( 'na.true')
test_that( "na.true", {           
  
 v <- c(T,NA,F)
 
 na.true(v) ->.; expect_equal( ., c(T,T,F) )
 na.false(v) ->.; expect_equal( ., c(T,F,F) )         

 v <- c( 'a',NA_character_,'c' )
 na.true(v) ->.; expect_equal(., c('a','TRUE','c') )
 na.false(v) ->.; expect_equal(., c('a','FALSE','c') )

 v <- c(1,NA_integer_,3)
 na.true(v) ->.; expect_equal(., c(1,1,3))   
 na.false(v) ->.; expect_equal(., c(1,0,3) )
 
})
