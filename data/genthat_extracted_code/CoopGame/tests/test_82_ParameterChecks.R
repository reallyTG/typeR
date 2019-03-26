boolSkip=F

test_that("Check 82.1 - stopOnInvalidGameVector" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  A1=NULL #1000
  A2=1:6  #1001
  A3=c("1","2","3","4","5","6","7") #1002
  A4=1:15; #1003
  A5=rep(0,7) #1004
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidGameVector(paramCheckResult,v=A1))
  expect_equal(paramCheckResult$errCode,1000) #Error Code 1000: Game vector A is invalid as 'NULL'
  expect_error(stopOnInvalidGameVector(paramCheckResult,v=A2))
  expect_equal(paramCheckResult$errCode,1001) #Error Code 1001: Number of elements in A is invalid 
  expect_error(stopOnInvalidGameVector(paramCheckResult,v=A3))
  expect_equal(paramCheckResult$errCode,1002) #Error Code 1002: Type of game vector is not numeric
  expect_error(stopOnInvalidGameVector(paramCheckResult,v=A4,n=3))
  expect_equal(paramCheckResult$errCode,1003) #Error Code 1003: Game vector A has different number of players than n 
  expect_error(stopOnInvalidGameVector(paramCheckResult,v=A5))
  expect_equal(paramCheckResult$errCode,1004) #Error Code 1004: Null game specified, value for every player is 0 
})

test_that("Check 82.2 - stopOnInvalidGrandCoalitionN" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  N1=NULL #1010
  N2="3"  #1011
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidGrandCoalitionN(paramCheckResult,N1)) 
  expect_equal(paramCheckResult$errCode,1010) #Error Code 1010: Grand coalition vector N is invalid as 'NULL'
  expect_error(stopOnInvalidGrandCoalitionN(paramCheckResult,N=N2))
  expect_equal(paramCheckResult$errCode,1011) #Error Code 1011: Grand coalition vector N is invalid as not numeric
  
})

test_that("Check 82.3 - stopOnInvalidCoalitionS" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  S1=NULL #1020
  S2=c("1","2") #1021
  S3=c(1,2,3,4); N=c(1,2,3) #1022
  S4=c(1,2,3,4,5); n1=3; #1023
  S5=c(1,2,3,4,5);A=1:7; #1024
  paramCheckResult=c()
  expect_error(stopOnInvalidCoalitionS(paramCheckResult,S=S1))
  expect_equal(paramCheckResult$errCode,1020) #Error Code 1020: Coalition vector S is invalid as 'NULL'
  expect_error(stopOnInvalidCoalitionS(paramCheckResult,S=S2))
  expect_equal(paramCheckResult$errCode,1021) #Error Code 1021: Coalition vector S is invalid as not numeric
  expect_error(stopOnInvalidCoalitionS(paramCheckResult,S=S3,N = N))
  expect_equal(paramCheckResult$errCode,1022) #Error Code 1022: Coalition vector S no subset of grand coalition N'
  expect_error(stopOnInvalidCoalitionS(paramCheckResult,S=S4,n=n1))
  expect_equal(paramCheckResult$errCode,1023) #Error Code 1023: The number of players in S cannot be greater \cr than the number of players in N
  expect_error(stopOnInvalidCoalitionS(paramCheckResult,S=S5,v=A))
  expect_equal(paramCheckResult$errCode,1024) #Error Code 1024: Specified coalition is inconsistent to game vector
})

test_that("Check 82.4 - stopOnInvalidNumberOfPlayers" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  n1=1; #1050
  # There is no maximum number of players from version 0.2.0 onwards
  # n2=25; #1051
  #todo not numeric of length 1
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidNumberOfPlayers(paramCheckResult,n = n1))
  expect_equal(paramCheckResult$errCode,1050) #Error Code 1050: Number of players is invalid as below 2 
  #expect_error(stopOnInvalidNumberOfPlayers(paramCheckResult,n = n2))
  #expect_equal(paramCheckResult$errCode,1051) #Error Code 1051: Number of players is invalid as above 24
})




test_that("Check 82.5 - stopOnInvalidIndex" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  ix1=NULL #1070
  ix2="2" #1071
  ix3=15; n5=3 #1072
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidIndex(paramCheckResult,index = ix1))
  expect_equal(paramCheckResult$errCode,1070) #Error Code 1070: Index is 'NULL'. 
  expect_error(stopOnInvalidIndex(paramCheckResult,index = ix2))
  expect_equal(paramCheckResult$errCode,1071) #Error Code 1071: Index is 'not numeric'.
  expect_error(stopOnInvalidIndex(paramCheckResult,index = ix3, n=n5))
  expect_equal(paramCheckResult$errCode,1072) #Error Code 1072: Index is within the wrong range according to number of players n.
  
})

test_that("Check 82.7 - stopOnInvalidNChooseB" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  n1=NULL    #1080
  b1=NULL    #1081
  n2="4"     #1082
  b2="2"     #1083
  n3=3; b3=5 #1084
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidNChooseB(paramCheckResult,n = n1))
  expect_equal(paramCheckResult$errCode,1080) #Error Code 1080: Number of players 'n' is 'NULL' 
  expect_error(stopOnInvalidNChooseB(paramCheckResult,n=4,b = b1))
  expect_equal(paramCheckResult$errCode,1081) #Error Code 1081: Number of involved players 'b' is 'NULL' 
  expect_error(stopOnInvalidNChooseB(paramCheckResult,n = n2, b=2))
  expect_equal(paramCheckResult$errCode,1082) #Error Code 1082: Number of players 'n' is not 'numeric' 
  expect_error(stopOnInvalidNChooseB(paramCheckResult,n = n3, b=b2))
  expect_equal(paramCheckResult$errCode,1083) #Error Code 1083: Number of involved players 'b' is not 'numeric' 
  expect_error(stopOnInvalidNChooseB(paramCheckResult,n = n3, b=b3))
  expect_equal(paramCheckResult$errCode,1084) #Error Code 1084: Number of involved players 'b' is greater than \cr of players 'n'
})


test_that("Check 82.8 - stopOnInvalidBoolean" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  b1=1 #1120
  b2=logical(3) #1121
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidBoolean(paramCheckResult,boolean = b1))
  expect_equal(paramCheckResult$errCode,1120) #Error Code 1120: Parameter is not a boolean value 
  expect_error(stopOnInvalidBoolean(paramCheckResult,boolean = b2))
  expect_equal(paramCheckResult$errCode,1121) #Error Code 1121: Parameter is not of length 1
})

test_that("Check 82.9 - stopOnInvalidNumber" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  num="2" #1130
  num2=c(1,2,3) #1131
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidNumber(paramCheckResult,number = num)) 
  expect_equal(paramCheckResult$errCode,1130) #Error Code 1130: Parameter is not a number
  expect_error(stopOnInvalidNumber(paramCheckResult,number = num2))
  expect_equal(paramCheckResult$errCode,1131) #Error Code 1131: Parameter is not of length 1 
})

test_that("Check 82.11 - stopOnInvalidLeftRightGloveGame" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  L1=c(1,2); R1=c(3); N1=c(1,2,3,4) #1138
  L2=c(); R2=c(1:4); N2=c(1,2,3,4) #1139
  L3=c(1:4); R3=c(); N3=c(1,2,3,4) #1140
  L4=c(1,2); R4=c(2,3,4); N4=c(1,2,3,4) #1141
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidLeftRightGloveGame(paramCheckResult,L = L1, R = R1, N = N1)) 
  expect_equal(paramCheckResult$errCode,1140) #Error Code 1140: Not all players in L and R included. 
  expect_error(stopOnInvalidLeftRightGloveGame(paramCheckResult,L = L2, R = R2, N = N2))
  expect_equal(paramCheckResult$errCode,1141) #Error Code 1141: L must have size > 0.
  expect_error(stopOnInvalidLeftRightGloveGame(paramCheckResult,L = L3, R = R3, N = N3))
  expect_equal(paramCheckResult$errCode,1142) #Error Code 1142: R must have size > 0. 
  expect_error(stopOnInvalidLeftRightGloveGame(paramCheckResult,L = L4, R = R4, N = N4))
  expect_equal(paramCheckResult$errCode,1143) #Error Code 1143: L and R have to be disjoint sets. 
})

test_that("Check 82.12 - stopOnInvalidVetoPlayer" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  vp1=NULL
  vp2=c(1,2)
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidVetoPlayer(paramCheckResult,vetoPlayer = vp1))
  expect_equal(paramCheckResult$errCode,1190) #Error Code 1190: At least one veto player has to be specified 
  expect_error(stopOnInvalidVetoPlayer(paramCheckResult, vetoPlayer = vp2))
  expect_equal(paramCheckResult$errCode,1191) #Error Code 1191: Only a single veto player is allowed for this game
})

test_that("Check 82.13 - stopOnInvalidQuota" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  q1=-1 #5020
  q2="4" #5021
  q3=NULL #5022
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidQuota(paramCheckResult,q = q1))
  expect_equal(paramCheckResult$errCode,1031) #Error Code 1031: Quota must be greater than zero!
  expect_error(stopOnInvalidQuota(paramCheckResult,q = q2))
  expect_equal(paramCheckResult$errCode,1032) #Error Code 1032: Quota must be numeric!
  expect_error(stopOnInvalidQuota(paramCheckResult,q = q3))
  expect_equal(paramCheckResult$errCode,1030) #Error Code 1030: Invalid quota as q is NULL 
})

test_that("Check 82.14 - stopOnInvalidWeightVector" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  n1=4; w1=c(1,2,3)
  n2=3; w2=c("1","2","3")
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidWeightVector(paramCheckResult, n = n1, w = w1))
  expect_equal(paramCheckResult$errCode,1110) #Error Code 1110: Number of weights must be equal or greater than number of players in coalition!
  expect_error(stopOnInvalidWeightVector(paramCheckResult, n = n2, w = w2))
  expect_equal(paramCheckResult$errCode,1111) #Error Code 1111: Invalid weight vector as w is numeric 
})

test_that("Check 82.15 - stopOnInvalidDictator" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  dic1=NULL
  dic2="3"
  dic3=c(1,2,3)
  dic4=5; n4=3 
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidDictator(paramCheckResult, dictator = dic1))
  expect_equal(paramCheckResult$errCode,1093) #Error Code 1093: 'dictator' is 'NULL' 
  expect_error(stopOnInvalidDictator(paramCheckResult, dictator = dic2))
  expect_equal(paramCheckResult$errCode,1091) #Error Code 1091: Representation of 'dictator' is not 'numeric' 
  expect_error(stopOnInvalidDictator(paramCheckResult, dictator = dic3))
  expect_equal(paramCheckResult$errCode,1090) #Error Code 1090: 'dictator' does not contain one single element 
  expect_error(stopOnInvalidDictator(paramCheckResult, dictator = dic4, n=n4))
  expect_equal(paramCheckResult$errCode,1092) #Error Code 1092: 'dictator' is not element of grand coalition
})

test_that("Check 82.16 - stopOnInvalidEstate" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  E=-1
  E2="23"
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidEstate(paramCheckResult, E))
  expect_equal(paramCheckResult$errCode,1150) #Error Code 1150: Estate must be nonnegative! 
  expect_error(stopOnInvalidEstate(paramCheckResult, E2))
  expect_equal(paramCheckResult$errCode,1151) #Error Code 1151: Estate must be numeric!
})

test_that("Check 82.17 - stopOnInvalidClaimsVector" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  n1=4
  d1=c(1,2,3)
  n2=4
  d2=c("1","2","3","4")
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidClaimsVector(paramCheckResult, n1,d1))
  expect_equal(paramCheckResult$errCode,1160) #Error Code 1160: Number of claims must equal the number of players in the bankruptcy game!
  expect_error(stopOnInvalidClaimsVector(paramCheckResult, n2,d2))
  expect_equal(paramCheckResult$errCode,1161) #Error Code 1161: Invalid claims vector as d must be numeric 
})

test_that("Check 82.18 - stopOnInvalidAllocation" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  x1=NULL; #1100
  x2=c("1","2","3");n2=3; #1101
  n3=4;x3=c(1,2,4,5,6);#1102
  x4=c(1,2,3,4); A4=1:7; #1103
  
  paramCheckResult=getEmptyParamCheckResult()
  expect_error(stopOnInvalidAllocation(paramCheckResult, x=x1))      #Error Code 1100: Allocation 'x' is NULL 
  expect_equal(paramCheckResult$errCode,1100)
  expect_error(stopOnInvalidAllocation(paramCheckResult, x=x2,n=n2)) #Error Code 1101: Allocation 'x' is not of type numeric. 
  expect_equal(paramCheckResult$errCode,1101)
  expect_error(stopOnInvalidAllocation(paramCheckResult, x=x3,n=n3)) #Error Code 1102: Allocation 'x' has wrong number of elements according to number of players specified by 'n'. 
  expect_equal(paramCheckResult$errCode,1102)
  expect_error(stopOnInvalidAllocation(paramCheckResult, x=x4,v=A4)) #Error Code 1103: Allocation is inconsistent to game vector. 
  expect_equal(paramCheckResult$errCode,1103)
})
