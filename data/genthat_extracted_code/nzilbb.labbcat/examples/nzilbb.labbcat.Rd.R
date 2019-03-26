library(nzilbb.labbcat)


### Name: nzilbb.labbcat
### Title: Accessing Data Stored in 'LaBB-CAT' Instances
### Aliases: nzilbb.labbcat nzilbb.labbcat-package
### Keywords: package

### ** Examples

## connect to LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/", "demo", "demo")

## Get the 5 seconds starting from 10s as a mono 22kHz file
wav.file <- labbcat.getSoundFragment(labbcat, "AP2505_Nelson.eaf", 10.0, 15.0, 22050)




