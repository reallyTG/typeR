boolSkip=F

test_that("Check 48.1 - unanimity coefficients for 3 players and game vector A=(0,0,0,60,48,30,72) - see also example at Harald Wiese p.124" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,0,0,60,48,30,72)
  result=getUnanimityCoefficients(v)
  expect_equal(result, c(0,0,0,60,48,30,-66))
})


#Example comes from powerpoint presentation "DECISION DANS L'INCERTAIN ET THEORIE DES JEUX", MORETTI, RIOS & TSOUKIAS - URL: http://www.lamsade.dauphine.fr/~tsoukias/cooperative_games_eddimo.ppt
test_that("Check 48.2 - unanimity coefficients for 3 players and game vector A=(3,4,1,8,4,6,10) - example found on the internet" ,{
  if(boolSkip){
    skip("Test was skipped")
  }

  v=c(3,4,1,8,4,6,10);
  result=getUnanimityCoefficients(v);
  expect_equal(result, c(3,4,1,1,0,1,0));
})


test_that("Check 48.3 - unanimity coefficients for 3 players and game vector A=(3, 3, 3, 2, 5, 9, 9) - example from TUGlab file harsanyidividends.M" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  v=c(3, 3, 3, 2, 5, 9, 9);
  result=getUnanimityCoefficients(v);
  expect_equal(result, c(3,3,3,-4,-1,3,2));
})


test_that("Check 48.4 - unanimity coefficients for 3 players and game vector v=(0,2,1,1,4,1,6)" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  v=c(0,2,1,1,4,1,6);
  result=getUnanimityCoefficients(v);
  expect_equal(result, c(0,  2,  1, -1,  3, -2,  3));
})




