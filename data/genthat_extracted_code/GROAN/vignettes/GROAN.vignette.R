## ---- eval=TRUE, include=TRUE, echo=FALSE--------------------------------
#just to be sure
library(GROAN)

## ---- eval=FALSE, include=TRUE, echo=TRUE, results='hide'----------------
#  library(GROAN)
#  
#  #arrays of phenotypes
#  GROAN.KI$yield
#  GROAN.AI$yield
#  
#  #dataframes of SNP genotypes
#  GROAN.KI$SNPs
#  GROAN.AI$SNPs
#  
#  #dataframes of realized genotypic kinship
#  GROAN.KI$kinship
#  GROAN.AI$kinship

## ---- eval=TRUE, include=TRUE, echo=TRUE---------------------------------
#creating a GROAN.NoisyDataset without any extra noise injected
nds.no_noise = createNoisyDataset(
  name = 'PEA KI, no noise',
  genotypes = GROAN.KI$SNPs, 
  phenotypes = GROAN.KI$yield
)

#creating a GROAN.NoisyDataset adding noise sampled from a normal distribution
nds.normal_noise = createNoisyDataset(
  name = 'PEA KI, normal noise',
  genotypes = GROAN.KI$SNPs, 
  phenotypes = GROAN.KI$yield,
  noiseInjector = noiseInjector.norm,
  mean = 0,
  sd = sd(GROAN.KI$yield) * 0.5
)

#creating a third dataset, this time with data from the AI lines
nds.no_noise.AI = createNoisyDataset(
  name = 'PEA AI, no noise',
  genotypes = GROAN.AI$SNPs, 
  phenotypes = GROAN.AI$yield
)


## ----eval=TRUE, echo=TRUE, fig.align="center", fig.height=5, fig.width=5, include=TRUE----
#plotting the original phenotypes
plot(GROAN.KI$yield, pch=20, main = 'True (black) vs. Noisy (red)', xlab = 'Samples', ylab = 'Phenotypes')
#plotting an instance of the phenotypes with noise injected 
points(getNoisyPhenotype(nds.normal_noise), col='red')

## ----eval=TRUE, include=TRUE, echo=TRUE, , results='hold'----------------
#average correlation oscillates around 0.89
cor(GROAN.KI$yield, getNoisyPhenotype(nds.normal_noise))
cor(GROAN.KI$yield, getNoisyPhenotype(nds.normal_noise))
cor(GROAN.KI$yield, getNoisyPhenotype(nds.normal_noise))

## ----eval=TRUE, include=TRUE, echo=TRUE----------------------------------
#no noise injector ==> the original phenotypes are returned
all(GROAN.KI$yield == getNoisyPhenotype(nds.no_noise))

## ----eval=TRUE, include=TRUE, echo=TRUE----------------------------------
print(nds.no_noise)
print(nds.no_noise.AI)

## ---- eval=TRUE, include=TRUE, echo=TRUE---------------------------------
#creating a Workbench with default values 
wb = createWorkbench()

## ---- eval=TRUE, include=TRUE, echo=TRUE---------------------------------
#creating a GROAN.Workbench with default values explicitly assigned 
wb = createWorkbench(
  #parameters defining crossvalidation
  folds = 5, reps = 10, stratified = FALSE, 
  
  #parameters defining save-on-hard-disk policy
  outfolder = NULL, saveHyperParms = FALSE, saveExtraData = FALSE,
  
  #a regressor
  regressor = phenoRegressor.rrBLUP, regressor.name = 'rrBLUP'
)

## ---- eval=TRUE, include=TRUE, echo=TRUE---------------------------------
#adding a regressor to an existing Workbench
wb = addRegressor(
  #the Workbench to be updater
  wb,
  #the new regressor
  regressor = phenoRegressor.BGLR, regressor.name = 'Bayesian Lasso',
  
  #regressor-specific parameters
  type = 'BL'
)

## ---- eval=TRUE, include=TRUE, echo=TRUE---------------------------------
print(wb)

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #executing two GROAN test, same workbench, different datasets
#  res.no_noise     = GROAN.run(nds.no_noise, wb)
#  res.normal_noise = GROAN.run(nds.normal_noise, wb)
#  
#  #putting the results together for further analysis
#  res.total = rbind(res.no_noise, res.normal_noise)

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #defaults is a boxplot of Pearson's correlations
#  p = plotResult(res.total)
#  print(p)

## ---- out.width = "600px", eval=TRUE, include=TRUE, echo=FALSE-----------
knitr::include_graphics('plot1.png')

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #a barplot with 95% confidence interval of Pearson's correlations
#  p = plotResult(res.total, plot.type = 'bar_conf95')
#  print(p)

## ---- out.width = "600px", eval=TRUE, include=TRUE, echo=FALSE-----------
knitr::include_graphics('plot2.png')

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #a barplot of execution times per fold, in seconds
#  p = plotResult(res.total, plot.type = 'bar', variable = 'time')
#  print(p)

## ---- out.width = "600px", eval=TRUE, include=TRUE, echo=FALSE-----------
knitr::include_graphics('plot3.png')

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #collating the two example datasets
#  nds.double = createNoisyDataset(
#    name = 'KI and AI',
#    genotypes = rbind(GROAN.KI$SNPs, GROAN.AI$SNPs),
#    phenotypes = c(GROAN.KI$yield, GROAN.AI$yield),
#    strata = c(rep('KI', 103), rep('AI', ,105)) #we have 103 KI and 105 AI
#  )
#  
#  #the workbench will take into account strata
#  wb = createWorkbench(stratified = TRUE)
#  
#  #ready to go
#  res = GROAN.run(nds.double, wb)
#  plotResult(res, strata = 'single', plot.type = 'bar')

## ---- out.width = "600px", eval=TRUE, include=TRUE, echo=FALSE-----------
knitr::include_graphics('plot4.png')

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #a new GROAN.Workbench with NO crossvalidation and only one repetition
#  wb = createWorkbench(
#    folds = NULL, reps = 1,
#    regressor.name = 'rrBLUP', regressor = phenoRegressor.rrBLUP)
#  
#  #training on PEA.KI, testing on PEA.AI
#  res = GROAN.run(nds = nds.normal_noise, wb = wb, nds.test = nds.no_noise.AI)
#  
#  print(res[,c('dataset.train', 'dataset.test', 'pearson')])

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #a new GROAN.Workbench with 5-fold crossvalidation and only one repetition
#  wb = createWorkbench(
#    folds = 5, reps = 1,
#    regressor.name = 'rrBLUP', regressor = phenoRegressor.rrBLUP)
#  
#  #training on PEA.KI, testing on PEA.KI (crossvalidation) and PEA.AI
#  res = GROAN.run(nds = nds.normal_noise, wb = wb, nds.test = nds.no_noise.AI)
#  
#  print(res[,c('dataset.train', 'dataset.test', 'pearson')])

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #training on PEA.KI, testing on PEA.KI (crossvalidation), PEA.AI, and PEA.KI again (overfitting!)
#  res = GROAN.run(
#    nds = nds.normal_noise, wb = wb,
#    nds.test = list(nds.no_noise.AI, nds.no_noise)
#    )
#  
#  print(res[,c('dataset.train', 'dataset.test', 'pearson')])

## ----eval=TRUE, echo=TRUE, fig.align="center", fig.height=5, fig.width=5, include=TRUE----
  #GROAN.KI has 103 samples, we'll use the first 50 samples for training
  #and the remaining will be predicted
  my.pheno = GROAN.KI$yield
  my.pheno[51:103] = NA

  #doing the predictions
  res = phenoRegressor.rrBLUP(phenotypes = my.pheno, genotypes = GROAN.KI$SNPs)
  
  #we just obtained a list with the following fields
  print(names(res))
  
  #visualize the predictions
  plot(
    x = GROAN.KI$yield[51:103], xlab = 'Real values', 
    y = res$predictions[51:103], ylab = 'Predicted values'
  )
  abline(a=0, b=1) #adding first quadrant bisector, for reference

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #A noise injector adding a fixed bias to a random subset of about 50% of the data
#  my.noiseInjector.bias = function(phenotypes){
#    #an array of random booleans
#    labels = runif(length(phenotypes)) > 0.5
#  
#    #adding the bias (a fixed value of 5)
#    phenotypes[labels] = phenotypes[labels] + 5
#  
#    #returning the original phenotypes with added noise
#    return(phenotypes)
#  }

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #A GROAN.NoisyDataSet that embeds the bias noise
#  nds.bias_noise = createNoisyDataset(
#    name = 'PEA, bias noise',
#    genotypes = GROAN.KI$SNPs,
#    phenotypes = GROAN.KI$yield,
#    noiseInjector = my.noiseInjector.bias   #the function we defined above
#  )

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #An improved version of the above function, this time the bias is not fixed
#  my.noiseInjector.bias2 = function(phenotypes, bias = 5){
#    #an array of random booleans
#    labels = runif(length(phenotypes)) > 0.5
#  
#    #adding the bias (from the function argument)
#    phenotypes[labels] = phenotypes[labels] + bias
#  
#    #returning the original phenotypes with added noise
#    return(phenotypes)
#  }

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  #A NoisyDataSet with bias noise function, using the second version of the function
#  nds.bias_noise2 = createNoisyDataset(
#    name = 'PEA, bias noise, second function',
#    genotypes = GROAN.KI$SNPs,
#    phenotypes = GROAN.KI$yield,
#    noiseInjector = my.noiseInjector.bias2,   #the new version
#    bias = 20 #if omitted the default would be used
#  )

## ---- eval=FALSE, include=TRUE, echo=TRUE--------------------------------
#  phenoRegressor.dummy = function (phenotypes, genotypes, covariances, extraCovariates){
#    #no operation is actually required
#    return(list(
#      predictions = runif(length(phenotypes)), #predictions
#      hyperparams = c(some = 1, params='a'),
#      extradata = 'filler extra data for phenoRegressor.dummy'
#    ))
#  }

