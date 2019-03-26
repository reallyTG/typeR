#File description of test_indexCalculations_13.R:
#File aims at offering tests for functions which allows to determine the corresponding index of row in bit matrix or game vector in respect of specified coalition properties.
#First Section (tests for index search functions and specific parameter check function)
#-indexCoalition (Check 13.1 and 13.2)
#-indexCoalitionByBitVector (Check 13.3)
#Second section (tests for reverse search functions):
#-getPlayersFromIndex
#Third section of IndexCalculations.R contains search helper functions:
#-calcDistance (Check 13.5)
#-getStartPosition (Check 13.6)
#-indexLower (Check 13.7)
#-indexUpper (Check 13.8)

boolSkip=F

#with TEST_ITERATIONS is specified how often random test cases should be performed
TEST_ITERATIONS=20

#with MAX_NUMBER_OF_PLAYERS the maximal number of involved players is specified
MAX_NUMBER_OF_PLAYERS=10

#First Section: START

test_that("Check 13.1 - indexCoalition test for identifying position of coalition in a bit matrix bm with a random number of players n" ,{
  #For used game vector the aimed coalition value is equal to position (for better testing and number is random)

  if(boolSkip){
    skip("Test was skipped")
  }


  for(i in 1:TEST_ITERATIONS){
    #Select on random number of players n who are involved in the game
    numberOfPlayers=sample(2:MAX_NUMBER_OF_PLAYERS,1)

    #Select randomly subset of all players n for coalition S (number as well as selection of player is casual)
    S=sort(sample(1:numberOfPlayers,sample(1:numberOfPlayers,1),replace = FALSE))

    #create bit matrix
    bm=createBitMatrix(numberOfPlayers)

    #Calculate index for coalition in bit matrix
    indexC=indexCoalition(numberOfPlayers, S)

    #Get for indexC involved player from bit matrix
    identifiedPlayers=sort(getPlayersFromBMRow(bmRow = bm[indexC,]))

    #Compare if players extracted (identifiedPlayers) from bit matrix on indexC is same to original set of players S
    expect_equal(S, identifiedPlayers)
  }
})

test_that("Check 13.2 - indexCoalition test for identifying position of coalition for all possibilities when maximal number of players is MAX_NUMBER_OF_PLAYERS" ,{

  if(boolSkip){
    skip("Test was skipped")
  }

  for(n in 2:MAX_NUMBER_OF_PLAYERS){
    #Get all possible coalitions in binary (member: 1 -> involved; 0 -> not involved)
    coalitions=createBitMatrix(n)
    for(i in 1:nrow(coalitions)){
      #Get vector S with involved players
      S=unname(which(coalitions[i,1:n]&1))

      #Calculate index for coalition in bit matrix
      indexC=indexCoalition(n, S)

      #Get involved player from bit matrix for indexC
      identifiedPlayers=sort(getPlayersFromBMRow(bmRow = coalitions[indexC,]))

      #Compare if players extracted (identifiedPlayers) from bit matrix on indexC is same to original set of players S
      expect_equal(S, identifiedPlayers)
    }
  }
})

test_that("Check 13.3 - indexCoalitionByBitVector test for identifying position of coalition in a bit matrix bm for all possibilities when maximal number of players is MAX_NUMBER_OF_PLAYERS" ,{

  if(boolSkip){
    skip("Test was skipped")
  }

  for(n in 2:MAX_NUMBER_OF_PLAYERS){
    #Get all possible coalitions in binary (member: 1 -> involved; 0 -> not involved)
    coalitions=createBitMatrix(n)
    for(i in 1:nrow(coalitions)){
      #Get bit vector with involved players
      bitVector=unname(coalitions[i,1:n])

      #Calculate index for coalition in bit matrix
      indexC=indexCoalitionByBitVector(n, bitVector)

      expect_equal(indexC, i)
    }
  }

})

#First Section: END

#Second Section: START


test_that("Check 13.4 - getPlayersFromIndex test: Checks all possibilities when maximal number of players is MAX_NUMBER_OF_PLAYERS" ,{

  if(boolSkip){
    skip("Test was skipped")
  }

  for(n in 2:MAX_NUMBER_OF_PLAYERS){
    #Get all possible coalitions in binary (member: 1 -> involved; 0 -> not involved)
    coalitions=createBitMatrix(n)
    for(i in 1:nrow(coalitions)){
      #Get bit vector with involved players from bit matrix to compare
      expectedS=unname(which(coalitions[i,1:n]&1))

      #Use function for detecting involved players
      detectedS=getPlayersFromIndex(n,i)

      expect_equal(expectedS, detectedS)
    }
  }



})

#Second Section: END

#Third section: START
test_that("Check 13.5 - calcDistance test: Checks various exemplary test cases" ,{

  if(boolSkip){
    skip("Test was skipped")
  }

  #  createBitMatrix(n=6)[22:41,]
  # Output (bit matrix entries for n=6 players where number of involved players is 3):
  #  [1,]  1 1 1 0 0 0    0 <=TC1
  #  ...
  #  [11,] 0 1 1 1 0 0    0 <=TC2
  #  ...
  #  [17,] 0 0 1 1 1 0    0 <=TC3

  expect_equal(calcDistance(dif=1,n=6,b=3),0) #TC1
  expect_equal(calcDistance(dif=2,n=6,b=3),10) #TC2
  expect_equal(calcDistance(dif=3,n=6,b=3),16) #TC3
})



test_that("Check 13.6 - getStartPosition test: Check for 3 and 4 players" ,{

  if(boolSkip){
    skip("Test was skipped")
  }
# createBitMatrix(n=3)
# Output:
#               cVal
#   [1,] 1 0 0    0 #TC1
#   [2,] 0 1 0    0 #TC4
#   [3,] 0 0 1    0 #TC6
#   [4,] 1 1 0    0 #TC2
#   [5,] 1 0 1    0
#   [6,] 0 1 1    0 #TC5
#   [7,] 1 1 1    0 #TC3
  expect_equal(getStartPosition(1,n=3,b=1),1) #TC1
  expect_equal(getStartPosition(1,n=3,b=2),4) #TC2
  expect_equal(getStartPosition(1,n=3,b=3),7) #TC3
  expect_equal(getStartPosition(2,n=3,b=1),2) #TC4
  expect_equal(getStartPosition(2,n=3,b=2),6) #TC5
  expect_equal(getStartPosition(3,n=3,b=1),3) #TC6

# createBitMatrix(n=4)
# Output:
#                   cVal
#   [1,]  1 0 0 0    0  #TC1
#   [2,]  0 1 0 0    0  #TC5
#   [3,]  0 0 1 0    0  #TC8
#   [4,]  0 0 0 1    0  #TC10
#   [5,]  1 1 0 0    0  #TC2
#   [6,]  1 0 1 0    0
#   [7,]  1 0 0 1    0
#   [8,]  0 1 1 0    0  #TC6
#   [9,]  0 1 0 1    0
#   [10,] 0 0 1 1    0  #TC9
#   [11,] 1 1 1 0    0  #TC3
#   [12,] 1 1 0 1    0
#   [13,] 1 0 1 1    0
#   [14,] 0 1 1 1    0  #TC7
#   [15,] 1 1 1 1    0  #TC4
  #player 1
  expect_equal(getStartPosition(1,n=4,b=1),1) #TC1
  expect_equal(getStartPosition(1,n=4,b=2),5) #TC2
  expect_equal(getStartPosition(1,n=4,b=3),11) #TC3
  expect_equal(getStartPosition(1,n=4,b=4),15) #TC4
  #player 2
  expect_equal(getStartPosition(2,n=4,b=1),2) #TC5
  expect_equal(getStartPosition(2,n=4,b=2),8) #TC6
  expect_equal(getStartPosition(2,n=4,b=3),14) #TC7
  #player 3
  expect_equal(getStartPosition(3,n=4,b=1),3) #TC8
  expect_equal(getStartPosition(3,n=4,b=2),10) #TC9
  #player 4
  expect_equal(getStartPosition(4,n=4,b=1),4) #TC10
})

test_that("Check 13.7 - indexLower test: Check exemplary for 3, 4 and 5 players" ,{

  if(boolSkip){
    skip("Test was skipped")
  }
  #For 3 players
  expect_equal(indexLower(n=3,b=1),1)
  expect_equal(indexLower(n=3,b=2),4)
  expect_equal(indexLower(n=3,b=3),7)

  #For 4 players
  expect_equal(indexLower(n=4,b=1),1)
  expect_equal(indexLower(n=4,b=2),5)
  expect_equal(indexLower(n=4,b=3),11)
  expect_equal(indexLower(n=4,b=4),15)

  #For 5 players
  expect_equal(indexLower(n=5,b=1),1)
  expect_equal(indexLower(n=5,b=2),6)
  expect_equal(indexLower(n=5,b=3),16)
  expect_equal(indexLower(n=5,b=4),26)
  expect_equal(indexLower(n=5,b=5),31)

})

test_that("Check 13.8 - indexUpper test: Check exemplary for 3, 4 and 5 players" ,{

  if(boolSkip){
    skip("Test was skipped")
  }
  #For 3 players
  expect_equal(indexUpper(n=3,b=1),3)
  expect_equal(indexUpper(n=3,b=2),6)
  expect_equal(indexUpper(n=3,b=3),7)

  #For 4 players
  expect_equal(indexUpper(n=4,b=1),4)
  expect_equal(indexUpper(n=4,b=2),10)
  expect_equal(indexUpper(n=4,b=3),14)
  expect_equal(indexUpper(n=4,b=4),15)

  #For 5 players
  expect_equal(indexUpper(n=5,b=1),5)
  expect_equal(indexUpper(n=5,b=2),15)
  expect_equal(indexUpper(n=5,b=3),25)
  expect_equal(indexUpper(n=5,b=4),30)
  expect_equal(indexUpper(n=5,b=5),31)

})
#Third section: END


