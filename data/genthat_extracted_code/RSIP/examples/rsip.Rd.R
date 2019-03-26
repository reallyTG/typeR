library(RSIP)


### Name: Remote Sensing and Image Processing
### Title: Remote Sensing and Image Processing
### Aliases: rsip maskFile exportValueGrid exportValuePoligon
###   exportValuePointShp exportValuePointsTxt plotAll trmmToTiff

### ** Examples

## Not run:
    ## File location
    #setwd("C:/Users/abia/Desktop/DataRSIP")

    ## Mask.
    #shp_poligon <- 'AB_Limit_Mantaro'  #To Assign the name poligon (cathment)
    #maskFile(shp_poligon, nam="RSIP_", dimname=c(17,26))

    ## Export value grid all.
    #exportValueGrid()

    ## Export value from poligon.
    #exportValuePoligon(shp_poligon)

    ## Export value from point .shp extension file
    #shp_station <-'AB_Station_Mantaro' #To Assign the name station
    #exportValuePointShp(shp_station)

    ## Export value from point .txt extension file (lon, lat, name)
    #txt_xy<-read.table('Data_station.txt', header=TRUE) #Read txt data
    data(Data_station)
    summary(Data_station)
    #exportValuePointsTxt(Data_station)

    ## Plot all tif file.
    #plotAll()

    ## 3B42 TRMM .nc4 files, processing to .tif files
    #trmmToTiff()

## End(**Not run**)



