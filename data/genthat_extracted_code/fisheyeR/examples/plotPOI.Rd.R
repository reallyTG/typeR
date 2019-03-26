library(fisheyeR)


### Name: plotPOI
### Title: Functions for POI plotting
### Aliases: plotPOI plotPOIGraph

### ** Examples

## Not run: 
##D    
##D    ## rgb colors 
##D    rgbPOI = POICreate(type = 'POI', wordsInQuery = c('red','green','blue'),
##D                        colores = colors(), itemsCol = colors(),
##D                        docs = cbind(colors(), 1:length(colors())),
##D                        cos.query.docs = rep(1,length(colors())),
##D                        matrizSim = t(col2rgb(colors())) / max(t(col2rgb(colors())))
##D    )
##D    POIcoords(rgbPOI) <- POICalc(rgbPOI ,length(rgbPOI@wordsInQuery))
##D    try(rm('POI.env'), silent = T)
##D    plotPOI(rgbPOI)
##D    
##D    ## graph example
##D    # igraph package  -- graph.tree example looks great!
##D    if (require(igraph)) {
##D      GRAPH <- graph.tree(500, children = 10, mode = 'in')    
##D      fCompress <- 350 # compress factor
##D      graphPOI <- POICreate(type = 'POIGraph')
##D      graphPOI@objeto <- layout.fruchterman.reingold(GRAPH,dim = 2) / fCompress
##D      graphPOI@EDGES <- cbind(GRAPH[[3]],GRAPH[[4]]) + 1 
##D      graphPOI@docs <- matrix(c(seq(1:nrow(graphPOI@objeto)), seq(1:nrow(graphPOI@objeto))), ncol = 2)
##D      try(rm('POI.env'), silent = T)
##D      plotPOIGraph(graphPOI)
##D     } 
##D    # manually made  -- but igraph example looks great!!
##D    graphPOI <- POICreate(type = 'POIGraph')
##D    graphPOI@objeto <- graphPOI@objeto <- rbind(c(0,.05), c(.05,0), c(0,-.05), c(-.05,0) ,round(circulo(0,0,.3,PLOT = FALSE),2))
##D    graphPOI@EDGES <-  matrix(c(rep(1,25), rep(2,25), rep(3,25), rep(4,25), seq(1,100)), ncol = 2)
##D    graphPOI@docs <- matrix(c(seq(1:nrow(graphPOI@objeto)), seq(1:nrow(graphPOI@objeto))), ncol = 2)
##D    graphPOI@colores <- c(rep(2,25), rep(3,25), rep(4,25), rep(5,25))
##D    try(rm('POI.env'), silent = T)
##D    plotPOIGraph(graphPOI)
##D 
##D    ## IRIS Example
##D    data(iris)
##D    # distance of each element to each dimension max and min
##D    matrizSim = cbind(
##D        1 - (max(iris[,1]) - iris[,1]) / (max(max(iris[,1]) - iris[,1])),
##D        1 - (max(iris[,2]) - iris[,2]) / (max(max(iris[,2]) - iris[,2])),
##D        1 - (max(iris[,3]) - iris[,3]) / (max(max(iris[,3]) - iris[,3])),
##D        1 - (max(iris[,4]) - iris[,4]) / (max(max(iris[,4]) - iris[,4])),
##D        1 - (min(iris[,1]) - iris[,1]) / (min(min(iris[,1]) - iris[,1])),
##D        1 - (min(iris[,2]) - iris[,2]) / (min(min(iris[,2]) - iris[,2])),
##D        1 - (min(iris[,3]) - iris[,3]) / (min(min(iris[,3]) - iris[,3])),
##D        1 - (min(iris[,4]) - iris[,4]) / (min(min(iris[,4]) - iris[,4])))
##D 
##D    matrizSim  = matrizSim^3 
##D    irisPOI = POICreate('POI')
##D    irisPOI@matrizSim <- matrizSim
##D    irisPOI@wordsInQuery <- c('high.Sepal.Length', 'high.Sepal.Width', 
##D                              'high.Petal.Length', 'high.Petal.Width',
##D                              'low.Sepal.Length', 'low.Sepal.Width', 
##D                              'low.Petal.Length', 'low.Petal.Width')
##D    POIcoords(irisPOI) <- POICalc(irisPOI ,length(irisPOI@wordsInQuery))
##D    irisPOI@docs <- cbind(matrix(seq(1:nrow(irisPOI@objeto))),matrix(seq(1:nrow(irisPOI@objeto))))
##D    irisPOI@colores <- c(rep(2,50),rep(3,50),rep(4,50))
##D    try(rm('POI.env'), silent = T)
##D    plotPOI(irisPOI)
##D 
##D    ## USArrest Example
##D    # POIS = (high - low) murder, assault and rape rates
##D    # colors = Population
##D    data(USArrests)
##D    matrizSim = cbind(
##D     1 - (max(USArrests[,1]) - USArrests[,1]) / (max(max(USArrests[,1]) - USArrests[,1])),
##D     1 - (max(USArrests[,2]) - USArrests[,2]) / (max(max(USArrests[,2]) - USArrests[,2])),
##D     1 - (max(USArrests[,4]) - USArrests[,4]) / (max(max(USArrests[,4]) - USArrests[,4])),                                                                                    
##D     1 - (min(USArrests[,1]) - USArrests[,1]) / (min(min(USArrests[,1]) - USArrests[,1])),
##D     1 - (min(USArrests[,2]) - USArrests[,2]) / (min(min(USArrests[,2]) - USArrests[,2])),
##D     1 - (min(USArrests[,4]) - USArrests[,4]) / (min(min(USArrests[,4]) - USArrests[,4])))
##D 
##D    usaPOI = POICreate('POI')
##D    usaPOI@matrizSim <- matrizSim
##D    usaPOI@wordsInQuery <- c(paste('High', names(USArrests[,c(1,2,4)])), paste('Low', names(USArrests[,c(1,2,4)])))
##D    POIcoords(usaPOI) <- POICalc(usaPOI ,length(usaPOI@wordsInQuery))
##D    usaPOI@docs <- cbind(matrix(rownames(USArrests)),matrix(seq(1:nrow(usaPOI@objeto))))
##D    usaPOI@cos.query.docs <-  USArrests[,3] / max(USArrests[,3])
##D    POIcolors(usaPOI)<- query2Cols(usaPOI, 'terrain')
##D    try(rm('POI.env'), silent = T)
##D    plotPOI(usaPOI)
##D 
##D    ## clusters  EXAMPLE
##D    x <- matrix(rnorm(1500, mean = 0, sd = .5), ncol = 5) 
##D    atipV1 = sample(nrow(x), as.integer(nrow(x)/3)) # outliers in V1
##D    atipV2 = sample(nrow(x), as.integer(nrow(x)/3)) # outliers in V2
##D    x[atipV1, 1] <- rnorm(100, mean = 2, sd = .5)  
##D    x[atipV2, 2] <- rnorm(100, mean = 2, sd = .5)  
##D    cl <- kmeans(x, 3, iter.max = 100 ,nstart = 25)
##D    matrizSim =  sqrt(round((x - colMeans(x))^2,1 )/nrow(x))    # simmilarity within outliers
##D    # OR (uncomment one)
##D    # matrizSim =  1 - sqrt(round((x - colMeans(x))^2,1 )/nrow(x))    # simmilarity within mean
##D    varPOI = POICreate('POI')
##D    varPOI@matrizSim <- matrizSim
##D    varPOI@wordsInQuery <- 1:ncol(matrizSim)
##D    POIcoords(varPOI) <- POICalc(varPOI ,length(varPOI@wordsInQuery))
##D    # if elements labels bother 
##D    varPOI@docs  <- cbind(rep(' ',nrow(varPOI@objeto)),matrix(seq(1:nrow(varPOI@objeto)))) 
##D    varPOI@cos.query.docs <-  rep(1,nrow(matrizSim))
##D    varPOI@colores <- cl$cluster  + 1
##D    try(rm('POI.env'), silent = T)
##D    plotPOI(varPOI)
##D  
## End(Not run)



