library(leafSTAR)


### Name: star
### Title: Calculate the silhouette to area ratio
### Aliases: star
### Keywords: star

### ** Examples

## No test: 
## Example with an 'Ahmes'-type input
data(olea)
star_olea<-star(olea,lat=40,long=4,tz=2,Ahmes=TRUE)
 # Add results to the original dataset
    olea1<-fixfile(olea) # Fix the original dataset
    olea2<-cbind(olea1,as.data.frame(star_olea))

 # Example with an input different to 'Ahmes' data
  data(olive)
   star_olive<-star(olive,lat=olive$latitude,long=olive$longitude,
               local.time=olive$hour,tz=olive$tz, Ahmes=FALSE,
               ID=olive$leafID,tilt.ang=olive$tilt,horiz=TRUE,
               course=olive$course,date=olive$date)
  # Add results to the original dataset.
   olive2<-cbind(olive,as.data.frame(star_olive)) # Since it does not
                                                 # come from 'Ahmes', 
                                                 # it is not necessary 
                                                 # to run fixfile().

## Input date formats. The three examples give the same result.
   # 1. With Julian date
        julian_olive<-star(olive,lat=olive$latitude,long=olive$longitude,
                      local.time=olive$hour,tz=olive$tz,
                      Ahmes=FALSE,ID=olive$leafID,tilt.ang=olive$tilt,horiz=TRUE,
                      course=olive$course,date=25) # January 25th
 
   # 2. With standard date
        std_olive<-star(olive,lat=olive$latitude,long=olive$longitude,
                   local.time=olive$hour,tz=olive$tz,
                   Ahmes=FALSE,ID=olive$leafID,tilt.ang=olive$tilt,horiz=TRUE,
                   course=olive$course,date="2017/01/25") # January 25th 2017.
                         # Date should be quoted. o.format is not needed.

   # 3. With non-standard date
        nonstd_olive<-star(olive,lat=olive$latitude,long=olive$longitude,
                      local.time=olive$hour,tz=olive$tz, Ahmes=FALSE,
                      ID=olive$leafID,tilt.ang=olive$tilt,horiz=TRUE,
                      course=olive$course,date="25/01/2017",o.format="%d/%m/%Y") 
               # January 25th 2017. Date should be quoted. o.format is necessary.
## End(No test)
# star()



