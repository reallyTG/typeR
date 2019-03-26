library(RCMIP5)


### Name: getProjectionMatrix
### Title: Calculate projection matrix to translate one grid to another
### Aliases: getProjectionMatrix

### ** Examples

numOrgLon <- 3
numOrgLat <- 3
orgLon <- matrix(seq(0, 360-360/numOrgLon, by=360/numOrgLon) + 360/numOrgLon/2, 
                 nrow=numOrgLon, ncol=numOrgLat)
orgLat <- matrix(seq(-90, 90-180/numOrgLat, by=180/numOrgLat) + 180/numOrgLat/2, 
                 nrow=numOrgLon, ncol=numOrgLat, byrow=TRUE)
orgArea <- list(lon = orgLon, lat=orgLat)

numProjLon <- 2
numProjLat <- 2
projLon <- matrix(seq(0, 360-360/numProjLon, by=360/numProjLon) + 360/numProjLon/2, 
                 nrow=numProjLon, ncol=numProjLat)
projLat <- matrix(seq(-90, 90-180/numProjLon, by=180/numProjLon) + 180/numProjLon/2, 
                 nrow=numProjLon, ncol=numProjLat, byrow=TRUE)
projArea <- list(lon = projLon, lat=projLat)

transferMatrix <- getProjectionMatrix(orgArea = orgArea, projArea=projArea)



