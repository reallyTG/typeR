## ----startup, results='hide', echo=FALSE, message=FALSE------------------
library(mzID)
ps.options(pointsize=12)


## ----parsing, tidy=TRUE--------------------------------------------------
exampleFiles <- list.files(system.file('extdata', package = 'mzID'), 
                           pattern = '*.mzid', full.names = TRUE)
mzResults <- mzID(exampleFiles[5])
mzResults


## ----class_overview, tidy=TRUE-------------------------------------------
showClass('mzID')


## ----flattening, tidy=TRUE-----------------------------------------------
flatResults <- flatten(mzResults)
names(flatResults)
nrow(flatResults)

#The length of an mzID object is the number of PSM's
length(mzResults)


## ----inspection, tidy=TRUE-----------------------------------------------
flatResults$length
nchar(flatResults$sequence)
substr(flatResults$sequence, 1, 10)


