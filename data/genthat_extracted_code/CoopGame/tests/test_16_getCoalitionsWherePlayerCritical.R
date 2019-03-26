boolSkip=F


test_that("Check 16.1 - getCoalitionsWherePlayerCritical test for getting correct referencing" ,{
  if(boolSkip){
    skip("Test was skipped")
  }

  #Section for test customization - start
  numberOfPLayers=3
  bmRowNumber=5
  #each vector in rbind represents player with references to the coalitions he is a critical player
  expectedValues=rbind(c(4,5),c(4,6),c(5,6))
  #Section for test customization - end

  v=c(0,0,0,1,1,1,1)
  bm=createBitMatrix(n=numberOfPLayers,v)
  bmRowList=list()

  for(i in 1:numberOfPLayers){
    bmRowList[[i]]=getCriticalCoalitionsOfPlayer(player = i, v)[,bmRowNumber]
    #Remove names for easier comparison between expected with real findings
    names(bmRowList[[i]])=NULL
  }

  #Test if set of column bmRow (referencing the Bit Matrix) is equal to expected referenced entries
  for(i in 1:numberOfPLayers){
    expect_equal(c(bmRowList[[i]]), expectedValues[i,])
  }

})

test_that("Check 16.2 - getCoalitionsWherePlayerCritical" ,{
  if(boolSkip){
    skip("Test was skipped")
  }

  #Section for test customization - start
  numberOfPLayers=4
  bmRowNumber=6
  #each vector in rbind represents player with references to the coalitions he is a critical player
  expectedValues=rbind(c(5,6,7),c(5,8,9),c(6,8,10),c(7,9,10))
  #Section for test customization - end

  v=c(rep(0,4),rep(1,11))
  bm=createBitMatrix(n=numberOfPLayers,v)
  bmRowList=list()

  for(i in 1:numberOfPLayers){
    bmRowList[[i]]=getCriticalCoalitionsOfPlayer(player = i, v)[,bmRowNumber]
    #Remove names for easier comparison between expected with real findings
    names(bmRowList[[i]])=NULL
  }

  #Test if set of column bmRow (referencing the Bit Matrix) is equal to expected referenced entries
  for(i in 1:numberOfPLayers){
    expect_equal(c(bmRowList[[i]]), expectedValues[i,])
  }

})

