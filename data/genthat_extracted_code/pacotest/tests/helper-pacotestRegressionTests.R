library("pacotest")
library("testthat")
library("VineCopula")
library("numDeriv")
library("methods")

## Define all scenarios of pacotest that should be unit tested
pacotestOptions = list()
# Define the test types
pacotestOptions[[1]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[2]] = pacotestset(testType='CCC', grouping = 'TreeCCC',expMinSampleSize=56, finalComparison = 'pairwiseMax', sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[3]] = pacotestset(testType='CCC', grouping = 'TreeCCC',trainingDataFraction=0.34, finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[4]] = pacotestset(testType='CCC', grouping = 'TreeCCC',aggInfo="meanPairwise", finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[5]] = pacotestset(testType='CCC',grouping = "SumMedian", withEstUncert = FALSE)

pacotestOptions[[6]] = pacotestset(testType='CCC',grouping = "ProdThirdsII", withEstUncert = FALSE)

pacotestOptions[[7]] = pacotestset(testType='CCC',grouping = "SumThirdsIII", withEstUncert = FALSE)

pacotestOptions[[8]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[9]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all',expMinSampleSize=56, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[10]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all',trainingDataFraction=0.34, expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[11]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all',aggInfo="meanPairwise", expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")


pacotestOptions[[12]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[13]] = pacotestset(testType='CCC', grouping = 'TreeEC',expMinSampleSize=56, finalComparison = 'pairwiseMax', sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[14]] = pacotestset(testType='CCC', grouping = 'TreeEC',trainingDataFraction=0.34, finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[15]] = pacotestset(testType='CCC', grouping = 'TreeEC',aggInfo="meanPairwise", finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[16]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all', expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[17]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all',expMinSampleSize=56, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[18]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all',trainingDataFraction=0.34, expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")

pacotestOptions[[19]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all',aggInfo="meanPairwise", expMinSampleSize = 100, sizeKeepingMethod = "splitTrainEvaluate")


pacotestOptions[[20]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[21]] = pacotestset(testType='CCC', grouping = 'TreeCCC',expMinSampleSize=56, finalComparison = 'pairwiseMax', sizeKeepingMethod = "penalty")

pacotestOptions[[22]] = pacotestset(testType='CCC', grouping = 'TreeCCC',gamma0Partition='SumQuartiles', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[23]] = pacotestset(testType='CCC', grouping = 'TreeCCC',aggInfo="meanPairwise", finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[24]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[25]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all',expMinSampleSize=56, sizeKeepingMethod = "penalty")

pacotestOptions[[26]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all',gamma0Partition='SumQuartiles', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[27]] = pacotestset(testType='CCC', grouping = 'TreeCCC', finalComparison = 'all',aggInfo="meanPairwise", expMinSampleSize = 100, sizeKeepingMethod = "penalty")


pacotestOptions[[28]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[29]] = pacotestset(testType='CCC', grouping = 'TreeEC',expMinSampleSize=56, finalComparison = 'pairwiseMax', sizeKeepingMethod = "penalty")

pacotestOptions[[30]] = pacotestset(testType='CCC', grouping = 'TreeEC',gamma0Partition='SumQuartiles', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[31]] = pacotestset(testType='CCC', grouping = 'TreeEC',aggInfo="meanPairwise", finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[32]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[33]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all',expMinSampleSize=56, sizeKeepingMethod = "penalty")

pacotestOptions[[34]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all',gamma0Partition='SumQuartiles', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[35]] = pacotestset(testType='CCC', grouping = 'TreeEC', finalComparison = 'all',aggInfo="meanPairwise", expMinSampleSize = 100, sizeKeepingMethod = "penalty")




for (indPacotest in 1:35)
{
  if (any(indPacotest == c(1:4, 8:19)))
  {
    pacotestOptions[[indPacotest + 35]] = pacotestset(pacotestOptions[[indPacotest]], withEstUncert = TRUE, aggPvalsNumbRep = 1)
  }
  else
  {
    pacotestOptions[[indPacotest + 35]] = pacotestset(pacotestOptions[[indPacotest]], withEstUncert = TRUE)
  }
}

# Define the test types
pacotestOptions[[71]] = pacotestset(testType='VI')

pacotestOptions[[72]] = pacotestset(testType='EC',grouping = "ProdMedian")

pacotestOptions[[73]] = pacotestset(testType='EC',grouping = "ProdThirdsIII")

pacotestOptions[[74]] = pacotestset(testType='EC',grouping = "SumThirdsII")

pacotestOptions[[75]] = pacotestset(testType='ECOV',grouping = "ProdQuartiles", withEstUncert = FALSE)

pacotestOptions[[76]] = pacotestset(testType='ECOV',grouping = "ProdThirdsI", withEstUncert = FALSE)

pacotestOptions[[77]] = pacotestset(testType='ECOV',grouping = "SumThirdsI", withEstUncert = FALSE)

pacotestOptions[[78]] = pacotestset(testType='ECOV', grouping = 'TreeECOV', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[79]] = pacotestset(testType='ECOV', grouping = 'TreeECOV',expMinSampleSize=56, finalComparison = 'pairwiseMax', sizeKeepingMethod = "penalty")

pacotestOptions[[80]] = pacotestset(testType='ECOV', grouping = 'TreeECOV',gamma0Partition='SumQuartiles', finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[81]] = pacotestset(testType='ECOV', grouping = 'TreeECOV',aggInfo="meanPairwise", finalComparison = 'pairwiseMax', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[82]] = pacotestset(testType='ECOV', grouping = 'TreeECOV', finalComparison = 'all', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[83]] = pacotestset(testType='ECOV', grouping = 'TreeECOV', finalComparison = 'all',expMinSampleSize=56, sizeKeepingMethod = "penalty")

pacotestOptions[[84]] = pacotestset(testType='ECOV', grouping = 'TreeECOV', finalComparison = 'all',gamma0Partition='SumQuartiles', expMinSampleSize = 100, sizeKeepingMethod = "penalty")

pacotestOptions[[85]] = pacotestset(testType='ECOV', grouping = 'TreeECOV', finalComparison = 'all',aggInfo="meanPairwise", expMinSampleSize = 100, sizeKeepingMethod = "penalty")


indThres = 1
for (iTest in c(75:78, 80:85))
{
  pacotestOptions[[85 + indThres]] = pacotestset(pacotestOptions[[iTest]], withEstUncert = TRUE)
  indThres = indThres + 1
}


for (indPacotest in 1:8)
{
  pacotestOptions[[indPacotest + 95]] = pacotestset(pacotestOptions[[indPacotest+19]], withEstUncert = TRUE, estUncertWithRanks = TRUE)
}


## setup some seeds
set.seed(1921)
seedsPerTest = sample(1:2222, 250)


## load hard-coded results

if (getRversion() >= "3.6.0")
{
  hardCodedResults = read.table("hardCodedResEcorr_rversion_gt3_6_0.csv", header = FALSE, sep = ",")
  hardCodedResPacotestRvineSingleCopula = read.table("hardCodedResPacotestRvineSingleCopula_rversion_gt3_6_0.csv", header = FALSE, sep = ",", na.strings=c("NA"))
  hardCodedResPacotestRvineSeq = as.matrix(read.table("hardCodedResPacotestRvineSeq_rversion_gt3_6_0.csv", header = FALSE, sep = ",", na.strings=c("NA")))
} else
{
  hardCodedResults = read.table("hardCodedResEcorr.csv", header = FALSE, sep = ",")
  hardCodedResPacotestRvineSingleCopula = read.table("hardCodedResPacotestRvineSingleCopula.csv", header = FALSE, sep = ",", na.strings=c("NA"))
  hardCodedResPacotestRvineSeq = as.matrix(read.table("hardCodedResPacotestRvineSeq.csv", header = FALSE, sep = ",", na.strings=c("NA")))
}
colnames(hardCodedResPacotestRvineSeq) <- NULL
## Simulate sample data


set.seed(3131)
# Simulate first data set
N = 1000
data1 = matrix(runif(3*N),N,3)
theta = (4*data1[,1]-2)^3

etheta = expm1(-theta);
data1[,3] = -1/theta*log(1+etheta/(exp(-theta*data1[,2])*(1/data1[,3]-1)+1));

# Simulate second data set
N = 1002
data2 = matrix(runif(5*N),N,5)


# Simulate third data set
N = 1050
data3 = matrix(runif(3*N),N,3)
theta = 12 + 8*sin(0.4*(3*data3[,1]+2)^2)

etheta = expm1(-theta);
data3[,3] = -1/theta*log(1+etheta/(exp(-theta*data3[,2])*(1/data3[,3]-1)+1));

# Simulate fourth data set
N = 1070
W = matrix(runif(3*N),N,3)
data4 = matrix(NA,N,3)
theta = 2

data4[,1] = W[,1]
data4[,2] = (W[,1]^(-theta)*(W[,2]^((-theta)/(1+theta))-1)+1)^(-1/theta);
theta_23_1 = theta /(1+theta)
data4[,3] = (W[,2]^(-theta_23_1)*(W[,3]^((-theta_23_1)/(1+theta_23_1))-1)+1)^(-1/theta_23_1);
data4[,3] = (W[,1]^(-theta)*(data4[,3]^((-theta)/(1+theta))-1)+1)^(-1/theta);
# Get Pseudo-Obs from the conditional copula C_23|1
U = matrix(NA,N,2)
U[,1] = (data4[,1]^theta*(data4[,2]^(-theta)-1)+1)^(-(1+theta)/theta);
U[,2] = (data4[,1]^theta*(data4[,3]^(-theta)-1)+1)^(-(1+theta)/theta);

data4[,c(2,3)] = U

data = list(data1, data2, data3, data4)


set.seed(51312)
# Data set 6
N= 768
# Four-dimensional D-vine
structure = matrix(c(4,0,0,0,
                     1,3,0,0,
                     2,1,2,0,
                     3,2,1,1),4,4,TRUE)

families = array(3,dim=dim(structure))
families  = matrix(c(0,0,0,0,
                     5,0,0,0,
                     1,1,0,0,
                     2,2,2,0),4,4,TRUE)
par2  = matrix(c(0,0,0,0,
                 0,0,0,0,
                 0,0,0,0,
                 2.5,8,6,0),4,4,TRUE)
par  = matrix(c(0,0,0,0,
                5,0,0,0,
                0.4,0.3,0,0,
                0.5,0.8,0.6,0),4,4,TRUE)
names = c("V1", "V2", "V3","V4")

rvm = VineCopula::RVineMatrix(structure,families,par,par2,names)
rvm = VineCopula::RVineMatrixNormalize(rvm)

data5 = VineCopula::RVineSim(N,rvm)

rvmHatData5 = VineCopula::RVineSeqEst(data5,rvm)


pacotestForData1_4 <- function(data, pacotestOptions)
{
  
  nDataSets = length(data)
  
  res = vector('numeric', length=nDataSets)
  
  for (iDataSet in 1:nDataSets)
  {
    if (dim(data[[iDataSet]])[2] == 3)
    {
      res[iDataSet] = pacotest(data[[iDataSet]][,c(2,3)],data[[iDataSet]][,1],pacotestOptions)$pValue
    }
    else
    {
      if (dim(data[[iDataSet]])[2] == 5)
      {
        res[iDataSet] = pacotest(data[[iDataSet]][,c(1,5)],data[[iDataSet]][,c(2,3,4)],pacotestOptions)$pValue
      }
    }
    
  }
  
  return(res)
  
}

unitTestKernel <- function(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
{
  maxNTests = length(pacotestOptions)
  
  resPacotestComputed = matrix(NA, maxNTests, 4)
  for (iTest in thisTestsInd)
  {
    set.seed(seedsPerTest[iTest])
    
    optionValues = paste(pacotestOptions[[1]],';', sep='')
    optionNames = paste(names(pacotestOptions[[1]]),':', sep='')
    optionString = paste(c(rbind(optionNames,optionValues)), collapse=" ")
    
    
    resPacotestComputed[iTest,] = pacotestForData1_4(data, pacotestOptions[[iTest]])
    for (iDataset in 1:4)
    {
      expect_equal(resPacotestComputed[iTest, iDataset], hardCodedResults[iTest, iDataset], tolerance = 1e-2,
                   info = paste("Data set number: ", iDataset, "; pacotestOptions: ", optionString, collapse=''))
      
    }
  }
  
  return(resPacotestComputed)
  
}

filterPacotestOptionLists <- function(pacotestOptions, properties, values)
{
  maxNTests = length(pacotestOptions)
  nProperties = length(properties)
  
  ind = matrix(NA, maxNTests, nProperties)
  
  for (iProperty in 1:nProperties)
  {
    ind[,iProperty] = sapply(pacotestOptions, function(x) identical(as.character(x[[properties[iProperty]]]), values[iProperty]))
  }
  
  xx = apply(ind, 1, all)
  yy = 1:maxNTests
  
  thisTestsInd = yy[xx]
  
  return(thisTestsInd)
  
}



