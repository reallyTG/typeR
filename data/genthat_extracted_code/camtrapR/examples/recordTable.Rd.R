library(camtrapR)


### Name: recordTable
### Title: Generate a species record table from camera trap images
### Aliases: recordTable

### ** Examples

wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")

if (Sys.which("exiftool") != ""){        # only run these examples if ExifTool is available


rec_table1 <- recordTable(inDir               = wd_images_ID,
                       IDfrom                 = "directory",
                       minDeltaTime           = 60,
                       deltaTimeComparedTo    = "lastRecord",
                       writecsv               = FALSE,
                       additionalMetadataTags = c("EXIF:Model", "EXIF:Make")
)
# note argument additionalMetadataTags: it contains tag names as returned by function exifTagNames

rec_table2 <- recordTable(inDir               = wd_images_ID,
                       IDfrom                 = "directory",
                       minDeltaTime           = 60,
                       deltaTimeComparedTo    = "lastRecord",
                       exclude                = "NO_ID",
                       writecsv               = FALSE,
                       timeZone               = "Asia/Kuala_Lumpur",
                       additionalMetadataTags = c("EXIF:Model", "EXIF:Make", "NonExistingTag")
)
# note the warning that the last tag in "additionalMetadataTags" was not found


any(rec_table1$Species == "NO_ID")
any(rec_table2$Species == "NO_ID")


#############
# here's how the removeDuplicateRecords argument works

## Not run: 
##D    # this is because otherwise the test would run too long to pass CRAN tests
##D 
##D rec_table3a <- recordTable(inDir              = wd_images_ID,
##D                        IDfrom                 = "directory",
##D                        minDeltaTime           = 0,
##D                        exclude                = "NO_ID",
##D                        timeZone               = "Asia/Kuala_Lumpur",
##D                        removeDuplicateRecords = FALSE
##D )
##D 
##D rec_table3b <- recordTable(inDir              = wd_images_ID,
##D                        IDfrom                 = "directory",
##D                        minDeltaTime           = 0,
##D                        exclude                = "NO_ID",
##D                        timeZone               = "Asia/Kuala_Lumpur",
##D                        removeDuplicateRecords = TRUE
##D )
##D 
##D 
##D anyDuplicated(rec_tablea[, c("Station", "Species", "DateTimeOriginal")])   # got duplicates
##D anyDuplicated(rec_table3b[, c("Station", "Species", "DateTimeOriginal")])   # no duplicates
##D 
##D # after removing duplicates, both are identical:
##D whichAreDuplicated <- which(duplicated(rec_table3a[, c("Station", "Species", "DateTimeOriginal")]))
##D all(rec_table3a[-whichAreDuplicated,] == rec_table3b)
##D 
## End(Not run)

} else {                                # show function output if ExifTool is not available
message("ExifTool is not available. Cannot test function. Loading recordTableSample instead")
data(recordTableSample)
}




