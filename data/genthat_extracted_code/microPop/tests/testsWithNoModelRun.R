#Tests which don't require microPopModel() to be run


test_that('Test combinePathsFuncDefault.R',{

    growthRate = c(10,15,2)
    x = combinePathsFuncDefault('strainName', 'groupName', 
                              growthRate, 3, c('path1','path2','path3'))
    
    expect_equal(sum(x), 1, tol=0.0001)
    expect_equal(length(x), length(growthRate))

})

test_that("Test getGroupName.R",{

    x = getGroupName('Archea.10', c('Archea','Bananas'))
    expect_equal(x, 'Archea')

    #test that resource name is unchanged
    x = getGroupName('resName.10', c('Archea','Bananas'))
    expect_equal(x, 'resName.10')

})

test_that("Test pHFuncDefault",{
    
    val = 5
    parms = list(pHVal=val)
    x = pHFuncDefault(time, parms) 
    expect_true(is.finite(x))
    expect_true(x >= 0)

})

test_that("Test pHLimFuncDefault",{

    corners = matrix(NA,ncol=4,nrow=2)
    rownames(corners) = c('strain1','strain2')
    corners[1,] = c(1,2,3,4);     corners[2,] = c(1,3,5,7)
    parms = list('strainPHcorners'=corners)

    pHval = pHLimFuncDefault('strain1', 'groupName', pH=1.5, parms)
    expect_true(pHval >= 0)
    expect_true(pHval <= 1)
    expect_equal(length(pHval),1)
    expect_equal(pHval,0.5)
    pHval=pHLimFuncDefault('strain2', 'groupName', pH=2, parms)
    expect_true(pHval >= 0)
    expect_true(pHval <= 1)
    expect_equal(length(pHval),1)
    expect_equal(pHval,0.5)
    
})

test_that("Test pHcentreOfMass",{

    corners = matrix(NA,ncol=4,nrow=2)
    rownames(corners) = c('strain1','strain2')
    corners[1,] = c(1,2,3,4);     corners[2,] = c(1,3,5,7)
    parms = list('strainPHcorners'=corners)
    
    pHmid = pHcentreOfMass(strainName='strain1', 'groupName',
        pHLimFuncDefault, parms) 
    expect_equal(length(pHmid), 1)
    expect_equal(pHmid, 2.5)
    pHmid = pHcentreOfMass(strainName='strain2', 'groupName',
        pHLimFuncDefault, parms) 
    expect_equal(length(pHmid), 1)
    expect_equal(pHmid, 4)
    
})

test_that('Test subsetFunc.R',{

    gnames = c('group.a','group.b')
    pnames = c('f','g','h','i')
    rnames = c('c','d','e')
    #test for 3d array
    array.in = array(1, dim=c(2,3,4), dimnames=list(gnames,rnames,pnames))
    x = subsetFunc(array.in, gnames[1], pnames[2])

    expect_equal(length(x), 3)
    expect_equal(names(x), rnames)

    #test for 2d array
    array.in = array(1, dim=c(4,3), dimnames=list(pnames, rnames))
    x = subsetFunc(array.in, NULL, pnames[2])

    expect_equal(length(x), 3)
    expect_equal(names(x), rnames)

})

test_that("Test getPHcorners.R",{

    x = getPHcorners('Bacteroides', TRUE)

    expect_equal(rownames(x),'Bacteroides')
    expect_true(is.array(x))
    expect_equal(length(x),4)
    expect_true(sum(x) >= 0)
    expect_true(all(x >= 0))

    #test for error from NAs
    Bac1 = Bacteroides
    Bac1['pHcorners',1:5] = c('pH',1,2,3,NA)
    expect_error(getPHcorners('Bac1',TRUE))
    
})
 
test_that('Test massBalanceFuncDefault.R',{

    uptake = c(10,1,0)
    production = c(2,3,4)
    growthRate = c(3,7,NA)
    balanceTol = 1e-3
    
    expect_warning(massBalanceFuncDefault(uptake, production,
                                          growthRate, balanceTol, 'strainName'))
    
    growthRate = c(2,0,NA)
    
    expect_warning(massBalanceFuncDefault(uptake, production,
                                          growthRate, balanceTol, 'strainName'),NA)
    
})

test_that('Test removalRateFuncDefault.R',{

    washOut = seq(1,5)
    names(washOut) = paste('Res', seq(1,5), sep='')
    varValue = 2
    x = removalRateFuncDefault('Res1', varValue, NULL, time=1, washOut,NULL)
    
    expect_equal(names(x),'Res1')
    expect_equal(length(x),1)
    expect_true(x-washOut['Res1']*varValue==0)

})

test_that('Test replaceListItems.R',{

    list.in = list('bananas'=10, 'apples'=20, 'cheese'=3)
    list.default = list( 'bananas'=1, 'apples'=2, 'cheese'=3, 'sausages'=4)
    x = replaceListItems(list.in, list.default)
    expect_equal(length(x), length(list.default))
    expect_equal(x$bananas, 10)
    expect_equal(x$apples, 20)
    expect_equal(x$cheese, 3)
    expect_equal(x$sausages, 4)

})
