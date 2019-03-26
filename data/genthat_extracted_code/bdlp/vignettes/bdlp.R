## ------------------------------------------------------------------------
library(bdlp)
source(system.file("dangl2014.R", package = "bdlp"))

## ------------------------------------------------------------------------
dangl2014(info=T)

## ------------------------------------------------------------------------
library(MASS)
meta <- dangl2014(setnr=1)
meta

## ------------------------------------------------------------------------
library(MASS)
data <- generateData(meta)
head(data)

## ------------------------------------------------------------------------
meta <- dangl2014(1, seedinfo = list(120, "3.1.3", c("Mersenne-Twister", "Inversion")))
data <- generateData(meta)
head(data)

## ---- fig.width=5, fig.height=5, fig.align='center'----------------------
meta <- dangl2014(setnr=1)
plotMetadata(meta)

## ----results="hide", message=F, warning=F--------------------------------
generateDatabase(name = system.file("dangl2014.R", package = "bdlp"), setnr = 1, draws = 50)

## ------------------------------------------------------------------------
dangl2014 <- function(setnr = NULL, 
                      seedinfo = list(100, 
                                      paste(R.version$major, R.version$minor, sep = "."),
                                      RNGkind()), 
                      info = FALSE, 
                      metaseedinfo = list(100, 
                                          paste(R.version$major, R.version$minor, sep = "."),
                                          RNGkind())){

  inf <- data.frame(n = c(50, 40), k = c(2,2), shape = c("spherical", "spherical"))
  ref <- "Dangl R. (2014) A small simulation study. Journal of Simple Datasets 10(2), 1-10"
  if(info == T) return(list(summary = inf, reference = ref))

  if(is.null(metaseedinfo)) metaseedinfo <- seedinfo

  set.seed(metaseedinfo[[1]])
  RNGversion(metaseedinfo[[2]])
  RNGkind(metaseedinfo[[3]][1], metaseedinfo[[3]][2])

  if(setnr == 1) {
    return(new("metadata.metric", 
      clusters = list(c1 = list(n = 25, mu = c(4,5), Sigma=diag(1,2)),
                      c2 = list(n = 25, mu = c(-1,-2), Sigma=diag(1,2))),
      genfunc = MASS::mvrnorm, seedinfo = seedinfo))
  }
  if(setnr == 2){
    return(new("metadata.metric", 
      clusters = list(c1 = list(n = 20, mu = c(0,2), Sigma=diag(1,2)),
                      c2 = list(n = 20, mu = c(-1,-2), Sigma=diag(1,2))),
      genfunc = MASS::mvrnorm, seedinfo = seedinfo))
  }
}

## ----results="hide", message=F, warning=F--------------------------------
require(MASS)
m1 <- initializeObject(type = "metric", genfunc = mvrnorm, k = 2)
m1@clusters$cl1 <- list(n = 25, mu = c(4,5), Sigma = diag(1,2))
m1@clusters$cl2 <- list(n = 25, mu = c(-1,-2), Sigma = diag(1,2))

m2 <- initializeObject(type = "metric", genfunc = mvrnorm, k = 2)
m2@clusters$cl1 <- list(n = 44, mu = c(1,2), Sigma = diag(1,2))
m2@clusters$cl2 <- list(n = 66, mu = c(-5,-6), Sigma = diag(1,2))

saveSetup(name="miller2012.R", author="Mister Miller", mail="mister.miller@edu.com",
            inst="Unknown University", cit="Simple Data, pp. 23-24", objects=list(m1, m2),
            table=data.frame(n = c(50, 110), k = c(2,2), shape = c("spherical", "spherical")))

generateDatabase(name = "miller2012.R", setnr = 1, draws = 20)

## ------------------------------------------------------------------------
Fun1 <- function(x){x^2}
Fun2 <- function(x){sqrt(x)}
Fun3 <- function(x){sin(2*pi*x)}
functions <- list(Fun1 = Fun1, Fun2 = Fun2, Fun3 = Fun3)

interval <- c(0,1)
gridPoints <- 30

sd <- 0.2
n <- 100
minTimePoints <- 5
maxTimePoints <- 10
regular <- FALSE

grid <- sampleGrid(n, minTimePoints, maxTimePoints, gridPoints, regular)

meta <- new("metadata.functional", functions = functions, 
                                   gridMatrix = grid,
                                   sd=sd,
                                   sd_distribution="rnorm",
                                   interval = interval, 
                                   resolution=gridPoints,
                                   total_n = n, 
                                   minTimePoints = minTimePoints, 
                                   maxTimePoints = maxTimePoints, 
                                   regular=F)

data <- generateData(meta)
head(data)

