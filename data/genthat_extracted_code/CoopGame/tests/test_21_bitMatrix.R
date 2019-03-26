boolSkip=FALSE

#with TEST_ITERATIONS is specified how often random test cases should be performed
TEST_ITERATIONS=2048

#with MAX_NUMBER_OF_PLAYERS the maximal number of involved players is specified
MAX_NUMBER_OF_PLAYERS=10

#First Section tests for createBitMatrix: START


test_that("Check 21.4 - test if bit matrix created for 3 players created is equal to expected (A not specified)" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  #Define bit matrix manually
  expectedBitMatrix=rbind(
      c(1,0,0),
      c(0,1,0),
      c(0,0,1),
      c(1,1,0),
      c(1,0,1),
      c(0,1,1),
      c(1,1,1)
  )
  expectedBitMatrix=cbind(expectedBitMatrix,cVal=0)
  
  #Create bit matrix automatically
  actualBitMatrix=createBitMatrix(n=3)
  
  expect_equal(actualBitMatrix, expectedBitMatrix)
})


test_that("Check 21.5 - test if bit matrix created for 4 players created is equal to expected (A not specified)" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  #Define bit matrix manually
  expectedBitMatrix=rbind(
    c(1,0,0,0),
    c(0,1,0,0),
    c(0,0,1,0),
    c(0,0,0,1),
    c(1,1,0,0),
    c(1,0,1,0),
    c(1,0,0,1),
    c(0,1,1,0),
    c(0,1,0,1),
    c(0,0,1,1),
    c(1,1,1,0),
    c(1,1,0,1),
    c(1,0,1,1),
    c(0,1,1,1),
    c(1,1,1,1)
  )
  expectedBitMatrix=cbind(expectedBitMatrix,cVal=0)
  
  #Create bit matrix automatically
  actualBitMatrix=createBitMatrix(n=4)
  
  expect_equal(actualBitMatrix, expectedBitMatrix)
})
#First Section tests for createBitMatrix: END

#Second section tests:START
test_that("Check 21.6 - testing from getPlayersFromBitVector for all possibilities for either 3 or 4 players " ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  #All possibilities of subsets for 3 players
  expect_equal(getPlayersFromBitVector(bitVector = c(1,0,0,0)),c(1))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,1,0,0)),c(2))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,0,1,0)),c(3))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,1,0,0)),c(1,2))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,0,1,0)),c(1,3))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,1,1,0)),c(2,3))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,1,1,0)),c(1,2,3))
  
  #All possibilities of subsets for 4 players
  expect_equal(getPlayersFromBitVector(bitVector = c(1,0,0,0,0)),c(1))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,1,0,0,0)),c(2))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,0,1,0,0)),c(3))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,0,0,1,0)),c(4))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,1,0,0,0)),c(1,2))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,0,1,0,0)),c(1,3))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,0,0,1,0)),c(1,4))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,1,1,0,0)),c(2,3))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,1,0,1,0)),c(2,4))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,0,1,1,0)),c(3,4))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,1,1,0,0)),c(1,2,3))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,1,0,1,0)),c(1,2,4))
  expect_equal(getPlayersFromBitVector(bitVector = c(0,1,1,1,0)),c(2,3,4))
  expect_equal(getPlayersFromBitVector(bitVector = c(1,1,1,1,0)),c(1,2,3,4))
})

test_that("Check 21.7 - testing from getPlayersFromBitVector for all possibilities for either 3 or 4 players " ,{
  if(boolSkip){
    skip("Test was skipped")
  }
 bm3=createBitMatrix(n=3)
 bm4=createBitMatrix(n=4)
 
 #All possibilities for 3 players
 expect_equal(getPlayersFromBMRow(bm3[1,]),c(1))
 expect_equal(getPlayersFromBMRow(bm3[2,]),c(2))
 expect_equal(getPlayersFromBMRow(bm3[3,]),c(3))
 expect_equal(getPlayersFromBMRow(bm3[4,]),c(1,2))
 expect_equal(getPlayersFromBMRow(bm3[5,]),c(1,3))
 expect_equal(getPlayersFromBMRow(bm3[6,]),c(2,3))
 expect_equal(getPlayersFromBMRow(bm3[7,]),c(1,2,3))
 
 #All possibilities for 4 players
 expect_equal(getPlayersFromBMRow(bm4[1,]),c(1))
 expect_equal(getPlayersFromBMRow(bm4[2,]),c(2))
 expect_equal(getPlayersFromBMRow(bm4[3,]),c(3))
 expect_equal(getPlayersFromBMRow(bm4[4,]),c(4))
 expect_equal(getPlayersFromBMRow(bm4[5,]),c(1,2))
 expect_equal(getPlayersFromBMRow(bm4[6,]),c(1,3))
 expect_equal(getPlayersFromBMRow(bm4[7,]),c(1,4))
 expect_equal(getPlayersFromBMRow(bm4[8,]),c(2,3))
 expect_equal(getPlayersFromBMRow(bm4[9,]),c(2,4))
 expect_equal(getPlayersFromBMRow(bm4[10,]),c(3,4))
 expect_equal(getPlayersFromBMRow(bm4[11,]),c(1,2,3))
 expect_equal(getPlayersFromBMRow(bm4[12,]),c(1,2,4))
 expect_equal(getPlayersFromBMRow(bm4[13,]),c(1,3,4))
 expect_equal(getPlayersFromBMRow(bm4[14,]),c(2,3,4))
 expect_equal(getPlayersFromBMRow(bm4[15,]),c(1,2,3,4))
 
})
#Second section tests: END

#Third section general test: START
test_that("Check 21.8 - test if getPlayersFromBMRow and getPlayersFromIndex achieve equal outcomes when expected to" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  #Test all possibilities for specified MAX_NUMBER_OF_PLAYERS
  #Loop through all number of players in valid range 
  for(numberOfPlayers in 2:MAX_NUMBER_OF_PLAYERS){
    bm=createBitMatrix(numberOfPlayers)
    numberOfCoalitions=(2^numberOfPlayers)-1
    #Loop through all coalitions
    for(i in 1:numberOfCoalitions){
      #get players by index referencing row in bit matrix (created for n players)
      playersFromBMRow=getPlayersFromBMRow(bm[i,])
      #get player by index and n players taking part
      playersFromIndex=getPlayersFromIndex(n=numberOfPlayers, bitIndex = i)
      expect_equal(playersFromBMRow, playersFromIndex)
    }      
  }
})
#Third section general test: END


  