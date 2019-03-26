
library(testthat)
library(magrittr)

context( "inverse by name" )
test_that( 'inverse', {
# inverse names
  expect_equal( inverse( as.name('+') ), as.name('-') )
  expect_equal( inverse( as.name('-') ), as.name('+') )
  expect_equal( inverse( as.name('*') ), as.name('/') )
  expect_equal( inverse( as.name('/') ), as.name('*') )

  expect_equal( inverse( as.name('<') ), as.name('>=') )
  expect_equal( inverse( as.name('<=') ), as.name('>') )
  expect_equal( inverse( as.name('>') ), as.name('<=') )
  expect_equal( inverse( as.name('>=') ), as.name('<') )




context('inverse by function definition' )

  inverse( `==` )  %>% expect_identical( `!=` )  
  inverse( `!=` )  %>% expect_identical( `==` )

  inverse( `%in%` ) %>% expect_identical( `%!in%` )
  inverse( `%!in%` ) %>% expect_identical( `%in%` )

  inverse( `>` )   %>% expect_identical( `<=` )  
  inverse( `>=` )  %>% expect_identical( `<` )
  inverse( `<` )   %>% expect_identical( `>=` )
  inverse( `<=` )  %>% expect_identical( `>` )
  
  inverse( `+` ) %>% expect_identical( `-` )
  inverse( `-` ) %>% expect_identical( `+` )
  inverse( `*` ) %>% expect_identical( `/` )
  inverse( `/` ) %>% expect_identical( `*` )
})