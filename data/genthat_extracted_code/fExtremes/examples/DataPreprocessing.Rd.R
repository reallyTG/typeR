library(fExtremes)


### Name: DataPreprocessing
### Title: Extremes Data Preprocessing
### Aliases: DataPreprocessing blockMaxima findThreshold pointProcess
###   deCluster
### Keywords: programming

### ** Examples
 
## findThreshold -
# Threshold giving (at least) fifty exceedances for Danish data:
x <- as.timeSeries(data(danishClaims))
findThreshold(x, n = c(10, 50, 100))    

## blockMaxima -
# Block Maxima (Minima) for left tail of BMW log returns:
BMW <- as.timeSeries(data(bmwRet))
colnames(BMW) <- "BMW.RET"
head(BMW)
x <- blockMaxima( BMW, block = 65)
head(x)
## Not run: 
##D y <- blockMaxima(-BMW, block = 65)    
##D head(y) 
##D y <- blockMaxima(-BMW, block = "monthly")    
##D head(y)
## End(Not run)

## pointProcess -
# Return Values above threshold in negative BMW log-return data:
PP = pointProcess(x = -BMW, u = quantile(as.vector(x), 0.75))
PP
nrow(PP)

## deCluster -
# Decluster the 200 exceedances of a particular  
DC = deCluster(x = PP, run = 15, doplot = TRUE) 
DC
nrow(DC)



