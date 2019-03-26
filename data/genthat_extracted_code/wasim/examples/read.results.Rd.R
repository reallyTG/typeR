library(wasim)


### Name: read.results
### Title: read.results
### Aliases: read.results read.dates read.observations
### Keywords: utilities

### ** Examples

  unzip(system.file("weisseritz.zip", package="wasim"))
d.datum <- read.dates(file= "weisseritz/qgesww100.txt")  # Datumsreihe heisst jetzt d.datum
str(d.datum)

d.wasim.out <- read.results("", "weisseritz",ts.length=21937,subcatchments=2, ending="ww100.txt")    # Datensatz heisst jetzt d.wasim.out 

str(d.wasim.out)



