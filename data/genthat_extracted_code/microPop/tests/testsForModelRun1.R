#tests for when model is run for one group with just
#essential resources and only one strain

#Note loadTestDataFunc() is called in each test (so they are
#stand alone) but microPopModel() will only be run if it hasn't
#already been run for case1

source('loadTestDataFunc.R')


test_that('Test assignNAsToMFGs.R',{
    
    loadTestDataFunc(1)
    expect_error(assignNAsToMFGs(microbeNames,numPaths,keyRes,resourceNames),NA)

    Archea['halfSat','CH4']<<-2
    expect_error(assignNAsToMFGs(microbeNames,numPaths,keyRes,resourceNames))


})

test_that("Test checkResInfo",{

    loadTestDataFunc(1)

    resNames=c('res1')
    expect_error(checkResInfo(resNames,resInfo1))

    resNames=c('H2')
    expect_error(checkResInfo(resNames,resInfo1),NA)

})

test_that("Test checkStoichiom.R",{

    loadTestDataFunc(1)

    stoiTol=0.1

    expect_warning(checkStoichiom(stoichiom, Rtype, microbeNames, numPaths,
                   stoiTol,reBalanceStoichiom = FALSE),NA) 
    stoichiom['Archea','H2','path1']=20
    expect_warning(checkStoichiom(stoichiom, Rtype, microbeNames, numPaths,
                   stoiTol,reBalanceStoichiom = FALSE)) 
})


test_that("Test combineGrowthLimFuncDefault",{

    loadTestDataFunc(1)
 
    maxGrowthRate=out$parms$Pmats$maxGrowthRate[[microbeNames[1]]][1,]
    growthLim=c(0.5,0.1,NA,NA)
    names(growthLim)=resourceNames
        
    x = combineGrowthLimFuncDefault(allStrainNames[1], microbeNames[1], 'path1',
        subst=NULL, ess=resourceNames[1:2], 
        boost=NULL, bio.sub=NULL, maxGrowthRate, growthLim,
        keyResName='H2', nonBoostFrac=1) 

    expect_equal(x,0.5*0.1*maxGrowthRate['H2'],tolerance=0.001)

})

test_that("Test entryRateFuncDefault.R",{

    loadTestDataFunc(1)

    stateVarValues=c(seq(1,length(microbeNames)),seq(1,length(resourceNames)))
    names(stateVarValues)=c(microbeNames,resourceNames)
    inflowRate=rep(10,length(stateVarValues))
    names(inflowRate)=names(stateVarValues)   

    x=entryRateFuncDefault(varName=resourceNames[1], varValue=0.1, stateVarValues, time=1,
        inflowRate,parms=out$parms)
    
    expect_true(is.numeric(x))
    expect_equal(length(x),1)

    x=entryRateFuncDefault(varName=microbeNames[1], varValue=0.1, stateVarValues, time=1,
        inflowRate,parms=out$parms)

    expect_true(is.numeric(x))
    expect_equal(length(x),1)

})

test_that("Test getAllResources.R",{

    loadTestDataFunc(1)

    x=getAllResources(microbeNames)
    expect_true(is.vector(x))
    expect_equal(length(x),4)
    expect_equal(x,resourceNames)

})

test_that('Test getAllResources.R',{
    
    loadTestDataFunc(1)

    x=getAllResources('Archea')
    
    expect_true(all(is.character(x)))
    expect_equal(length(x),4)
    expect_equal(x,resourceNames)

})

test_that("Test getKeyRes.R",{

    loadTestDataFunc(1)
    x=getKeyRes(microbeNames,numPaths)

    expect_true(is.list(x))
    expect_equal(x$Archea[[1]],'H2')

})

test_that("Test getNonBoostFrac.R",{

   loadTestDataFunc(1)

    x=getNonBoostFrac(microbeNames,resourceNames,numPaths)

    expect_true(is.array(x))
    expect_equal(x['Archea',1,'path1'],1)

})

test_that("Test getNumPaths.R",{

    loadTestDataFunc(1)

    x=getNumPaths(microbeNames)

    expect_true(is.vector(x))
    expect_equal(x,round(x)) #test all are integers
    expect_equal(names(x),microbeNames)

})

test_that('Test getValues.R',{
    
    loadTestDataFunc(1)
    x=getValues(micInfo1, resInfo1, c(microbeNames, resourceNames),
                           'startValue',allStrainNames,microbeNames, resourceNames, 1)
    expect_equal(names(x),c(microbeNames,resourceNames))
    expect_equal(length(x),length(microbeNames)+length(resourceNames))
    expect_true(x[1]-micInfo1['startValue','Archea']==0)

})

test_that("Test growthLimFuncDefault.R",{

    loadTestDataFunc(1)

    resVal=seq(1,length(resourceNames))
    names(resVal)=resourceNames
    allSubType=Rtype[1,,1]
    strainHalfSat=halfSat[[microbeNames[1]]][1,]
    stateVarValues=c(1,resVal)
    names(stateVarValues)=c(microbeNames,resourceNames)
    
    x=growthLimFuncDefault(strainName=allStrainNames[1], groupName=microbeNames[1],
                         pathName='path1', varName=resourceNames[1],
                         resourceValues=resVal, allSubType, strainHalfSat, stateVarValues) 

    expect_true(x<=1)
    expect_true(x>=0)

})

test_that('Test makeParamMatrixG.R',{
    
    loadTestDataFunc(1)

    #check Rtype
    expect_error(makeParamMatrixG(microbeNames, 'Rtype', numPaths,
                                  resInfo1, 113, resourceNames),NA)
    x=makeParamMatrixG('Archea', 'Rtype', numPaths,
                                  resInfo1, 113, resourceNames)
    expect_true(is.array(x))
    expect_equal(dim(x),c(length(microbeNames),length(resourceNames),length(numPaths)))
    expect_equal(names(x['Archea',,'path1']),resourceNames)

    #check stoichiom
    expect_error(makeParamMatrixG(microbeNames, 'stoichiom', numPaths,
                                  resInfo1, 113, resourceNames),NA)
    x=makeParamMatrixG('Archea', 'stoichiom', numPaths,
                                  resInfo1, 113, resourceNames)
    expect_true(is.array(x))
    expect_equal(dim(x),c(length(microbeNames),length(resourceNames),length(numPaths)))
    expect_equal(names(x['Archea',,'path1']),resourceNames)
    
    #test capitalisation
    MFG1=Archea
    rownames(MFG1)[1]='rtype'
    numPaths1=numPaths
    names(numPaths1)='MFG1'
    
    expect_error(makeParamMatrixG('MFG1', 'Rtype', numPaths1,
                                  resInfo1, 113, resourceNames))

    rownames(MFG1)[5]='Stoichiom'
    expect_error(makeParamMatrixG('MFG1', 'Rtype', numPaths1,
                                  resInfo1, 113, resourceNames))

    
})

test_that('Test productionFuncDefault.R',{
    
    loadTestDataFunc(1)
    
    uptake=c(1,2,NA,NA)
    names(uptake)=resourceNames
    growthRate=1
    varName='CH4'
    products=c('CH4','H2O')
    all.substrates=c('H2','CO2')
    bio.products=NULL
    water=NULL
    stoi=stoichiom[,,'path1']
    x=productionFuncDefault('Archea', 'Archea', 'path1',varName,
                            all.substrates, 'H2',stoichiom=stoi, products,bio.products,
                            uptake, growthRate, yield, parms, water) 
    
    expect_true(x>=0)
    expect_true(is.finite(x))
    expect_equal(length(x),1)
                            
                            
})

test_that('Test uptakeFuncDefault.R',{
    
    loadTestDataFunc(1)
    
    varName='CO2'
    growthLim=c(0.4,0.9,NA,NA)
    names(growthLim)=resourceNames
    stoi=stoichiom[,,'path1']
    x=uptakeFuncDefault('Archea', 'Archea', 'path1',varName,keyResName='H2',
                        subst=NULL, ess=c('H2','CO2'),boost=NULL,
                        maxGrowthRate=maxGrowthRate$Archea[1,],
                        growthLim,yield$Archea[1,],nonBoostFrac=parms$nonBoostFrac[,,'path1'],
                        stoichiom=stoi,parms)

    expect_true(x>=0)
    expect_true(is.finite(x))
    expect_equal(length(x),1)
                            
                            
})
test_that('Test waterUptakeRatio.R',{

    loadTestDataFunc(1)

    x=waterUptakeRatio(microbeNames, stoichiom, Rtype, numPaths)
     
    expect_equal(rownames(x),microbeNames)
    expect_true(x-0==0)

    #change CO2 to be water substrate type:
    Rtype1=Rtype
    Rtype1['Archea','CO2',]='Sw'
    x=waterUptakeRatio(microbeNames, stoichiom, Rtype1, numPaths)
     
    expect_equal(rownames(x),microbeNames)
    expect_true(x-44/8==0)


})


test_that('Test makeParamMatrixS.R',{
    
    loadTestDataFunc(0)


    expect_error(makeParamMatrixS(resourceNames,microbeNames, 'halfSat', numPaths,
                                  out$parms$numStrains,strainOptions=list(),
                                  oneStrainRandomParams=FALSE),NA)
    expect_error(makeParamMatrixS(resourceNames,microbeNames, 'yield', numPaths,
                                  out$parms$numStrains,strainOptions=list(),
                                  oneStrainRandomParams=FALSE),NA)
    expect_error(makeParamMatrixS(resourceNames,microbeNames, 'maxGrowthRate',
                                  numPaths, out$parms$numStrains,strainOptions=list(),
                                  oneStrainRandomParams=FALSE),NA)
    
   expect_error(makeParamMatrixS(resourceNames,microbeNames, 'HalfSat', numPaths,
                                  out$parms$numStrains,strainOptions=list(),
                                  oneStrainRandomParams=FALSE))
    expect_error(makeParamMatrixS(resourceNames,microbeNames, 'Yield', numPaths,
                                  out$parms$numStrains,strainOptions=list(),
                                  oneStrainRandomParams=FALSE))
    expect_error(makeParamMatrixS(resourceNames,microbeNames, 'MaxGrowthRate',
                                  numPaths, out$parms$numStrains,strainOptions=list(),
                                  oneStrainRandomParams=FALSE))
    
    x=makeParamMatrixS(resourceNames,microbeNames, 'halfSat', numPaths,
                       out$parms$numStrains,strainOptions=list(),oneStrainRandomParams=FALSE)
                 
    expect_true(is.list(x))
    expect_equal(dim(x[[microbeNames[1]]]),c(length(numPaths),length(resourceNames)))
    expect_equal(names(x[[microbeNames[1]]]['path1',]),resourceNames)

     
})
