library(ecospat)


### Name: ecospat.makeDataFrame
### Title: Make Data Frame
### Aliases: ecospat.makeDataFrame

### ** Examples

## Not run: 
##D files <- list.files(path=paste(system.file(package="dismo"),
##D                                '/ex', sep=''), pattern='grd', full.names=TRUE )
##D predictors <- raster::stack(files[c(9,1:8)])   #file 9 has more NA values than
##D # the other files, this is why we choose it as the first layer (see ?randomPoints)
##D 
##D file <- paste(system.file(package="dismo"), "/ex/bradypus.csv", sep="")
##D bradypus <- read.table(file, header=TRUE, sep=',')[,c(2,3,1)]
##D head(bradypus)
##D 
##D random.spec <- cbind(as.data.frame(randomPoints(predictors,50,extf=1)),species="randomSpec")
##D colnames(random.spec)[1:2] <- c("lon","lat")
##D 
##D spec.list <- rbind(bradypus, random.spec)
##D 
##D df <- ecospat.makeDataFrame(spec.list, expl.var=predictors, n=5000)
##D head(df)
##D 
##D plot(predictors[[1]])
##D points(df[df$Bradypus.variegatus==1, c('x','y')])
##D points(df[df$randomSpec==1, c('x','y')], col="red")
##D 
## End(Not run)



