#Tests for functions involving multiple strains
#this is case 3

source('loadTestDataFunc.R')

test_that("Test Assign Strain Traits for non pH traits",{

    num=40
    meanT=5
    for (distn in c('normal','uniform')){
        strainOptions=list(percentTraitRange=20,distribution=distn)
        traits=assignStrainTraits(num,meanT,strainOptions,pHtrait=FALSE)
        expect_equal(length(traits),num)
        expect_equal(mean(traits),meanT,tolerance=0.1*meanT)
        max.range=meanT*(1+strainOptions$percentTraitRange/100) 
        min.range=meanT*(1-strainOptions$percentTraitRange/100)
        if (distn=='uniform'){
            expect_true(max(traits) <= max.range)
            expect_true(min(traits) >= min.range)
        }
        if (distn=='normal'){
            sds=NA*seq(1,1000)
            for (i in 1:1000){
                traits=assignStrainTraits(num,meanT,strainOptions,pHtrait=FALSE)
                sds[i]=sd(traits)
            }
            expect_equal(mean(sds),meanT*strainOptions$percentTraitRange/200,
                         0.1*meanT*strainOptions$percentTraitRange/200)
        }
    }
    
})
       
test_that("Test Assign Strain Traits for pH traits",{

    num=40
    meanT=5
    for (distn in c('normal','uniform')){
        strainOptions=list(distribution=distn,maxPHshift=0.7)
        traits=assignStrainTraits(num,meanT,strainOptions,pHtrait=TRUE)
        expect_equal(length(traits),num)
        expect_equal(mean(traits),meanT,tolerance=0.1*meanT)
        max.pHrange=meanT*(1+strainOptions$maxPHshift)
        min.pHrange=meanT*(1-strainOptions$maxPHshift)
        if (distn=='uniform'){
            expect_true(max(traits) <= max.pHrange)
            expect_true(min(traits) >= min.pHrange)
        }
        if (distn=='normal'){
            sds=NA*seq(1,1000)
            for (i in 1:1000){
                traits=assignStrainTraits(num,meanT,strainOptions,pHtrait=TRUE)
                sds[i]=sd(traits)
            }
            expect_equal(mean(sds),strainOptions$maxPHshift/2,
                         0.1*strainOptions$maxPHshift/2)
        }
    }

})
  
test_that("Test applyTraitTradeOffs",{

    loadTestDataFunc(2)

    tradeOffParams=strainOptions$tradeOffParams
    traits=applyTraitTradeOffs(microbeNames,tradeOffParams,numPaths,
        numStrains,parms$Pmats,resourceNames)
    
    expect_true(is.list(traits))
    #expect par1 (halfsat) to be sorted from bad to good (i.e. large to small)
    Bac.K=c(traits$halfSat$Bacteroides.1[1,'NSP'],traits$halfSat$Bacteroides.2[1,'NSP'],
             traits$halfSat$Bacteroides.3[1,'NSP'])
    Ace.K=c(traits$halfSat$Acetogens.1[1,'NSP'],traits$halfSat$Acetogens.2[1,'NSP'],
            traits$halfSat$Acetogens.3[1,'NSP'])
    expect_true(all(diff(Bac.K)<=0))
    expect_true(all(diff(Ace.K)<=0))
    
    #expect par2 (maxGrowthRate) to be sorted from good to bad (i.e. large to small)
    Bac.G=c(traits$maxGrowthRate$Bacteroides.1[1,'NSP'],
            traits$maxGrowthRate$Bacteroides.2[1,'NSP'],
            traits$maxGrowthRate$Bacteroides.3[1,'NSP'])
    Ace.G=c(traits$maxGrowthRate$Acetogens.1[1,'NSP'],
            traits$maxGrowthRate$Acetogens.2[1,'NSP'],
            traits$maxGrowthRate$Acetogens.3[1,'NSP'])
    expect_true(all(diff(Bac.G)<=0))
    expect_true(all(diff(Ace.G)<=0))
})
          
test_that("Test non pH corners bit of getStrainParametersFromFile.R",{

        filename=system.file('extdata/strainParams.csv',package='microPop')

        loadTestDataFunc(2)

        PARdata = read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
        strainOptions = list(paramsSpecified = TRUE, paramDataName = PARdata)
        
        expect_warning(getStrainParamsFromFile(out$parms$Pmats, out$parms$strainPHcorners, strainOptions))
        
        PARdata[2,1]='Bacteroides.3'
        strainOptions = list(paramsSpecified = TRUE, paramDataName = PARdata)
        x=getStrainParamsFromFile(out$parms$Pmats, out$parms$strainPHcorners, strainOptions) 
        
        expect_true(is.list(x))
        expect_equal(x[[1]][['maxGrowthRate']][['Bacteroides.1']][1,'NSP'],PARdata[1,3])
    
    
})


test_that("Test pH corners bit of getStrainParametersFromFile.R",{

    filename=system.file('extdata/strainParams.csv',package='microPop')

    loadTestDataFunc(2)
    
        PARdata = read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
        PARdata[2,1]='Bacteroides.3'
        
        strainOptions = list(paramsSpecified = TRUE, paramDataName = PARdata)
        
        x=getStrainParamsFromFile(out$parms$Pmats, out$parms$strainPHcorners, strainOptions) 
        
        expect_warning(getStrainParamsFromFile(out$parms$Pmats, out$parms$strainPHcorners, strainOptions),NA)
        expect_true(is.list(x))
        
        expect_true(x[[2]]['Acetogens.2',1]-as.numeric(PARdata[3,3])==0)
        expect_true(x[[2]]['Acetogens.2',2]-as.numeric(PARdata[3,4])==0)
        expect_true(x[[2]]['Acetogens.2',3]-as.numeric(PARdata[3,5])==0)
        expect_true(x[[2]]['Acetogens.2',4]-as.numeric(PARdata[3,6])==0)
    
})

test_that("Test getStrainPHcorners.R",{

    pHcorners = getPHcorners(microbeNames, pHLimit=TRUE)
    pHcorners[1,]=c(1,2,3,4)
    
    x=getStrainPHcorners(microbeNames,allStrainNames,numStrains,
        pHcorners,pHLimit=TRUE,
        strainOptions=list(randomParams='pHtrait',
            distribution='uniform',maxPHshift=0.1))
    
    expect_equal(dim(x),c(numStrains*length(microbeNames),4))
    expect_true(diff(range(x[1:numStrains,1]))<=0.2)
    expect_true(diff(range(x[1:numStrains,2]))<=0.2)
    expect_true(diff(range(x[1:numStrains,3]))<=0.2)
    expect_true(diff(range(x[1:numStrains,4]))<=0.2)
    expect_true(mean(x[1:numStrains,1])<=1.1)
    expect_true(mean(x[1:numStrains,2])>=1.9)
    expect_true(mean(x[1:numStrains,4])<=4.1)

})
