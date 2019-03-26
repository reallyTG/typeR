#tests which need a model run but doesn't matter which type

#Note loadTestDataFunc() is called in each test (so they are
#stand alone) but microPopModel() will only be run if it hasn't
#already been run before

source('loadTestDataFunc.R')

test_that('Test checkSolution.R',{
    
    loadTestDataFunc(0)
    expect_warning(checkSolution(out$solution),NA)
    out1=out
    out1$solution[10,allStrainNames[1]]=-10
    expect_warning(checkSolution(out1$solution))

})

test_that('Test makeInflowFromSoln.R',{
    
    loadTestDataFunc(0)
    x=makeInflowFromSoln(out)

    expect_equal(colnames(x),colnames(out$solution))
    expect_equal(length(x[,1]),length(out$solution[,1]))
    expect_false(any(is.na(x)))
    
})

