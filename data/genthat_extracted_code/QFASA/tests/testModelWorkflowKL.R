test_that("Model Workflow Regression KL", {

    set.seed(1234)
    dist.meas = 1

    ## Fatty Acids
    data(FAset)
    fa.set = as.vector(unlist(FAset))
    
    ## Predators
    data(predatorFAs)
    tombstone.info = predatorFAs[,1:4]
    predator.matrix = predatorFAs[,5:(ncol(predatorFAs))]
    npredators = nrow(predator.matrix)

    ## Prey
    data(preyFAs)
    prey.sub=(preyFAs[,4:(ncol(preyFAs))])[fa.set]
    prey.sub=prey.sub/apply(prey.sub,1,sum) 
    group=as.vector(preyFAs$Species)
    prey.matrix=cbind(group,prey.sub)
    prey.matrix=MEANmeth(prey.matrix) 

    FC = preyFAs[,c(2,3)] 
    FC = as.vector(tapply(FC$lipid,FC$Species,mean,na.rm=TRUE))

    ## Calibration Coefficients
    data(CC)
    cal.vec = CC[,2]
    cal.mat = replicate(npredators, cal.vec)

    # Run QFASA
    Q = p.QFASA(predator.matrix,
                prey.matrix,
                cal.mat,
                dist.meas,
                gamma=1,
                FC,
                start.val = rep(1,nrow(prey.matrix)),
                fa.set)

    # Diet Estimates
    DietEst = Q$'Diet Estimates'
    DietEst = round(DietEst*100,digits=2)
    colnames(DietEst) = (as.vector(rownames(prey.matrix)))
    DietEst = cbind(tombstone.info,DietEst)

    # Check diet estimates
    DietEstCheck = read.csv(file=system.file("exdata", "DietEstKL.csv", package="QFASA"),
                            as.is=TRUE)
    expect_equal(DietEst, DietEstCheck, tolerance=1e-6)

    # Additional Measures
    AdditionalMeasures = plyr::ldply(Q$'Additional Measures', data.frame)

    # Check additional measures
    AdditionalMeasuresCheck = read.csv(file=system.file("exdata", "AdditionalMeasuresKL.csv", package="QFASA"), as.is=TRUE)
    expect_equal(AdditionalMeasures, AdditionalMeasuresCheck, tolerance=1e-4)

})

