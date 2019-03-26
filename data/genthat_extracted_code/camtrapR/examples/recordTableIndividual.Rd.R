library(camtrapR)


### Name: recordTableIndividual
### Title: Generate a single-species record table with individual
###   identification from camera trap images
### Aliases: recordTableIndividual

### ** Examples


 wd_images_ID <- system.file("pictures/sample_images_tagged/LeopardCat", package = "camtrapR")
 # missing space in species = "LeopardCat" is because of CRAN package policies
 # note argument additionalMetadataTags: it contains tag names as returned by function exifTagNames

 if (Sys.which("exiftool") != ""){        # only run these examples if ExifTool is available

 rec_table_pbe <- recordTableIndividual(inDir                  = wd_images_ID,
                                        minDeltaTime           = 60,
                                        deltaTimeComparedTo    = "lastRecord",
                                        hasStationFolders      = FALSE,
                                        IDfrom                 = "metadata",
                                        camerasIndependent     = FALSE,
                                        writecsv               = FALSE,
                                        metadataIDTag          = "individual",
                                        additionalMetadataTags = c("EXIF:Model", "EXIF:Make"),
                                        timeZone               = "Asia/Kuala_Lumpur"
 )

 } else {                                # show function output if ExifTool is not available
 message("ExifTool is not available. Cannot test function")
 data(recordTableIndividualSample)
 }



