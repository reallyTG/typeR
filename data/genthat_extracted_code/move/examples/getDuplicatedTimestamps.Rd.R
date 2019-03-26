library(move)


### Name: getDuplicatedTimestamps
### Title: Identifies duplicated timestamps
### Aliases: getDuplicatedTimestamps
###   getDuplicatedTimestamps,character-method
###   getDuplicatedTimestamps,connection-method
###   getDuplicatedTimestamps,data.frame-method
###   getDuplicatedTimestamps,factor-method

### ** Examples

data(duplicatedDataExample)
getDuplicatedTimestamps(x=as.factor(duplicatedDataExample$individual.id), 
                        timestamps=as.POSIXct(duplicatedDataExample$timestamps, 
					      format="%Y-%m-%d %H:%M:%S", tz="UTC"),
                        sensorType=duplicatedDataExample$sensor.type)

filePath<-system.file("extdata","leroy.csv.gz",package="move")
getDuplicatedTimestamps(filePath)





