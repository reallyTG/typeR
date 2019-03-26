library(MplusAutomation)


### Name: prepareMplusData
### Title: Create tab-delimited file and Mplus input syntax from R
###   data.frame
### Aliases: prepareMplusData
### Keywords: interface

### ** Examples

## Not run: 
##D library(foreign)
##D 
##D study5 <- read.spss("reanalysis-study-5-mt-fall-08.sav", to.data.frame=TRUE)
##D ASData5 <- subset(study5, select=c("ppnum", paste("as", 1:33, sep="")))
##D 
##D prepareMplusData(ASData5, "study5.dat")
##D 
##D 
##D # basic example
##D test01 <- prepareMplusData(mtcars, "test01.dat")
##D 
##D 
##D 
##D # see that syntax was stored
##D test01
##D 
##D # example when there is a factor and logical
##D tmpd <- mtcars
##D tmpd$cyl <- factor(tmpd$cyl)
##D tmpd$am <- as.logical(tmpd$am)
##D prepareMplusData(tmpd, "test_type.dat")
##D rm(tmpd)
##D 
##D # by default, if re-run, data is re-written, with a note
##D test01b <- prepareMplusData(mtcars, "test01.dat")
##D 
##D # if we turn on hashing in the filename the first time,
##D # we can avoid overwriting notes the second time
##D test01c <- prepareMplusData(mtcars, "test01c.dat", hashfilename=TRUE)
##D 
##D # now that the filename was hashed in test01c, future calls do not re-write data
##D # as long as the hash matches
##D test01d <- prepareMplusData(mtcars, "test01c.dat",
##D   writeData = "ifmissing", hashfilename=TRUE)
##D 
##D # now that the filename was hashed in test01c, future calls do not re-write data
##D # as long as the hash matches
##D test01db <- prepareMplusData(mtcars, "test01d.dat",
##D   writeData = "ifmissing", hashfilename=TRUE)
##D 
##D # however, if the data change, then the file is re-written
##D test01e <- prepareMplusData(iris, "test01c.dat",
##D   writeData = "ifmissing", hashfilename=TRUE)
##D 
##D # tests for keeping and dropping variables
##D prepareMplusData(mtcars, "test02.dat", keepCols = c("mpg", "hp"))
##D prepareMplusData(mtcars, "test03.dat", keepCols = c(1, 2))
##D prepareMplusData(mtcars, "test04.dat",
##D   keepCols = c(TRUE, FALSE, FALSE, TRUE, FALSE,
##D   FALSE, FALSE, FALSE, FALSE, FALSE, FALSE))
##D 
##D prepareMplusData(mtcars, "test05.dat", dropCols = c("mpg", "hp"))
##D prepareMplusData(mtcars, "test06.dat", dropCols = c(1, 2))
##D prepareMplusData(mtcars, "test07.dat",
##D   dropCols = c(TRUE, FALSE, FALSE, TRUE, FALSE,
##D   FALSE, FALSE, FALSE, FALSE, FALSE, FALSE))
##D 
##D 
##D # interactive (test08.dat)
##D prepareMplusData(mtcars, interactive=TRUE)
##D 
##D # write syntax to input file, not stdout
##D prepareMplusData(mtcars, "test09.dat", inpfile=TRUE)
##D 
##D # write syntax to alternate input file, not stdout
##D prepareMplusData(mtcars, "test10.dat", inpfile="test10alt.inp")
##D 
##D # should be error, no file
##D prepareMplusData(mtcars, interactive=FALSE)
##D 
##D # new warnings if it is going to overwrite files
##D # (the default to be consistent with prior behavior)
##D prepareMplusData(mtcars, "test10.dat")
##D 
##D # new warnings if it is going to overwrite files
##D # (the default to be consistent with prior behavior)
##D prepareMplusData(mtcars, "test11.dat", inpfile="test10alt.inp")
##D 
##D # new errors if files exist and overwrite=FALSE
##D prepareMplusData(mtcars, "test10.dat",
##D   inpfile="test10alt.inp", overwrite=FALSE)
##D 
##D 
##D # can write multiply imputed data too
##D # here are three "imputed" datasets
##D idat <- list(
##D   data.frame(mpg = mtcars$mpg, hp = c(100, mtcars$hp[-1])),
##D   data.frame(mpg = mtcars$mpg, hp = c(110, mtcars$hp[-1])),
##D   data.frame(mpg = mtcars$mpg, hp = c(120, mtcars$hp[-1])))
##D 
##D # if we turn on hashing in the filename the first time,
##D # we can avoid overwriting notes the second time
##D testimp1 <- prepareMplusData(idat, "testi1.dat",
##D   writeData = "ifmissing", hashfilename=TRUE,
##D   imputed = TRUE)
##D 
##D # now that the filename was hashed, future calls do not re-write data
##D # as long as all the hashes match
##D testimp2 <- prepareMplusData(idat, "testi2.dat",
##D   writeData = "ifmissing", hashfilename=TRUE,
##D   imputed = TRUE)
##D 
##D # in fact, the number of imputations can decrease
##D # and they still will not be re-written
##D testimp3 <- prepareMplusData(idat[-3], "testi3.dat",
##D   writeData = "ifmissing", hashfilename=TRUE,
##D   imputed = TRUE)
##D 
##D # however, if the data changes, then all are re-written
##D # note that it warns for the two files that already exist
##D # as these two are overwritten
##D 
##D idat2 <- list(
##D   data.frame(mpg = mtcars$mpg, hp = c(100, mtcars$hp[-1])),
##D   data.frame(mpg = mtcars$mpg, hp = c(109, mtcars$hp[-1])),
##D   data.frame(mpg = mtcars$mpg, hp = c(120, mtcars$hp[-1])))
##D testimp4 <- prepareMplusData(idat2, "testi4.dat",
##D   writeData = "ifmissing", hashfilename=TRUE,
##D   imputed = TRUE)
##D 
##D 
## End(Not run)



