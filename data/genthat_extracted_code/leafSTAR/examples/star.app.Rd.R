library(leafSTAR)


### Name: star.app
### Title: Calculate the silhouette to area ratio from 'Ahmes' 1.0
### Aliases: star.app
### Keywords: 'Ahmes' star

### ** Examples

## No test: 
data(olea)
  starapp_olea<-star.app(olea,lat=40,long=4,tz=2)

 ## Add results to the original dataset
  olea1<-fixfile(olea) ## Fix the original dataset
  olea2<-cbind(olea1,as.data.frame(starapp_olea))
## End(No test)

#star.app()



