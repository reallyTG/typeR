library(hyperSpec)


### Name: read.txt.long
### Title: Import and Export of hyperSpec objects Besides 'save' and
###   'load', two general ways to import and export data into 'hyperSpec'
###   objects exist.
### Aliases: read.txt.long import export read.txt.wide write.txt.long
###   write.txt.wide
### Keywords: IO file

### ** Examples



## Not run: vignette  ("file-io")

## export & import matlab files
if (require (R.matlab)){
   # export to matlab file
   writeMat ("test.mat", x = flu[[]], wavelength = flu@wavelength,
             label = lapply (flu@label, as.character))

   # reading a matlab file
   data <- readMat ("test.mat")
   print (data)
   mat <- new ("hyperSpec", spc = data$x,
               wavelength = as.numeric(data$wavelength),
               label = data$label[,,1])
}

## ascii export & import


write.txt.long (flu,  file = "flu.txt", cols = c(".wavelength", "spc", "c"),
		order = c("c", ".wavelength"),
		decreasing = c(FALSE, TRUE))

read.txt.long (file = "flu.txt", cols = list (.wavelength = expression (lambda / nm),
      spc= "I / a.u", c = expression ("/" (c, (mg/l)))))

write.txt.wide (flu,  file = "flu.txt", cols = c("c", "spc"),
		col.labels = TRUE, header.lines = 2, row.names = TRUE)

write.txt.wide (flu,  file = "flu.txt", col.labels = FALSE, row.names = FALSE)

read.txt.wide (file = "flu.txt",
    # give columns in same order as they are in the file
    cols = list (spc = "I / a.u", c = expression ("/"("c", "mg/l")), filename = "filename", 
    # plus wavelength label last
    .wavelength = "lambda / nm"),
		header = TRUE)





