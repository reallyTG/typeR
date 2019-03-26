library(adfExplorer)


### Name: blank.amigaDOSDisk
### Title: Create blank disk with file system
### Aliases: blank.amigaDOSDisk blank.amigaDOSDisk,character-method

### ** Examples

## Create a blank virtual disk compatible with
## Amiga OS 1.x and up (Note that spaces in file and
## disk names are allowed but not recommended):
disk.os1x <- blank.amigaDOSDisk(diskname = "I'm_OS_1.x_compatible",
                                disktype = "DD",
                                filesystem = "OFS",
                                international = FALSE,
                                dir.cache = FALSE,
                                bootable = TRUE)

## create a disk that is compatable with OS 2.x and up
## (no backward compatability):
disk.os2x <- blank.amigaDOSDisk(diskname = "I'm_OS_2.x_compatible",
                                disktype = "DD",
                                filesystem = "FFS",
                                international = TRUE,
                                dir.cache = FALSE,
                                bootable = TRUE)

## create a disk that is compatable with OS 3.x and up
## (no backward compatability):
disk.os3x <- blank.amigaDOSDisk(diskname = "I'm_OS_3.x_compatible",
                                disktype = "DD",
                                filesystem = "FFS",
                                international = TRUE,
                                dir.cache = TRUE,
                                bootable = TRUE)



