### R code from vignette source 'Readshapefiles.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Readshapefiles.Rnw:7-8
###################################################
options(SweaveHooks=list(fig=function() par(mar=c(1,1,1,1))))


###################################################
### code chunk number 2: Readshapefiles.Rnw:26-32
###################################################
library(spatstat)
options(useFancyQuotes=FALSE)
sdate <- read.dcf(file = system.file("DESCRIPTION", package = "overlapptest"),
         fields = "Date")
sversion <- read.dcf(file = system.file("DESCRIPTION", package = "overlapptest"),
         fields = "Version")


###################################################
### code chunk number 3: Readshapefiles.Rnw:104-105
###################################################
library(maptools)


###################################################
### code chunk number 4: Readshapefiles.Rnw:109-110 (eval = FALSE)
###################################################
## x <- readShapeSpatial("mydata.shp")


###################################################
### code chunk number 5: Readshapefiles.Rnw:115-116 (eval = FALSE)
###################################################
## class(x)


###################################################
### code chunk number 6: Readshapefiles.Rnw:127-128
###################################################
dire<-getwd()


###################################################
### code chunk number 7: Readshapefiles.Rnw:131-133
###################################################
setwd(system.file("shapes", package="overlapptest"))
Androsace <- readShapeSpatial("Androsace.shp")


###################################################
### code chunk number 8: Readshapefiles.Rnw:135-136
###################################################
class(Androsace)


###################################################
### code chunk number 9: Readshapefiles.Rnw:138-139
###################################################
setwd(dire)


###################################################
### code chunk number 10: Readshapefiles.Rnw:147-149
###################################################
library(maptools)
library(spatstat)


###################################################
### code chunk number 11: Readshapefiles.Rnw:158-159
###################################################
spatstat.options(fixpolygons=FALSE)


###################################################
### code chunk number 12: Readshapefiles.Rnw:171-172
###################################################
Androsace<- as(Androsace, "owin")


###################################################
### code chunk number 13: Readshapefiles.Rnw:180-181 (eval = FALSE)
###################################################
## library(overlapptest)


###################################################
### code chunk number 14: Readshapefiles.Rnw:195-218
###################################################
check.ventana <-
function(ventana){
    malos1 <- NULL
    malos2<- NULL
    for( i in 1:length(ventana$bdry)){
       test <- try(owin(poly=ventana$bdry[[i]]), silent=TRUE)
       if(class(test)=="try-error"){
            malos1<- c(malos1, i) # anota en que subpoligono hay un error
            # intenta darle la vuelta a las coordenadas a ver si eso lo resuleve
            test2 <- try( owin(poly=lapply(ventana$bdry[[i]], rev), silent=TRUE))
              if(class(test2)!="try-error"){
                   # si al dar la vuelta a las cooredenadas se arregla, grabamos las nuevas coordenadas
                   ventana$bdry[[i]] <-lapply(ventana$bdry[[i]], rev)
	        } else malos2<- c(malos2, i)
	}
     }
   attr(ventana, "corrected")  <-malos1
   attr(ventana, "not.corrected") <- malos2
   if(!is.null(malos1)) cat( length(malos1), "problematic polygon(s) detected \n \n")
   if(!is.null(malos1) & is.null(malos2)) cat("all problematic polygons have been repared\n \n")
   if(!is.null(malos2)) cat(length(malos2), "problematic polygon(s) could not been repared\n \n")
   return(ventana)
}


###################################################
### code chunk number 15: Readshapefiles.Rnw:221-222
###################################################
Androsace <- check.ventana(Androsace)


###################################################
### code chunk number 16: Readshapefiles.Rnw:228-229
###################################################
options(width=80)


###################################################
### code chunk number 17: Readshapefiles.Rnw:231-232
###################################################
attributes (Androsace)


