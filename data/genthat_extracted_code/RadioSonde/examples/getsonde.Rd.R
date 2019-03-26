library(RadioSonde)


### Name: getsonde
### Title: read a radiosonde file to an R dataframe.
### Aliases: getsonde
### Keywords: manip

### ** Examples

# Read a typical radiosonde (ASCII) datafile, headers and all.
# The datakey,varkey,and unitkey arguments come from examining 
# the datafile. The whitespace is important.

# The Sonde text file is stored in this package as a text dataset (this is just
# to make it easier to include in the package.)
# First create a real text file to read in
  data( ExampleSondeText)
  write( ExampleSondeText, file="SondeFile.txt")

  sample.sonde <- getsonde("SondeFile.txt")
# NOTE this assumes that the default datakey, varkey and unitkey. 
# it is best to check the file for these choices!
  attr(sample.sonde,"units")
  attr(sample.sonde,"metadata")

#  skewt plot of data
  plotsonde(sample.sonde,title="SondeFile.txt")

#
# Read the same radiosonde dataset, but ignore the units ... 
#
  datakey  <- "------"
  varkey   <- " Time"
  sample.sonde <- getsonde("SondeFile.txt",datakey,varkey)
  attr(sample.sonde,"metadata")



