library(automagic)


### Name: parse_packages
### Title: Parse R code for required packages
### Aliases: parse_packages

### ** Examples

cat('library(ggplot2)\n # library(curl)\n require(leaflet)\n CB::date_print()\n',file='temp.R')
parse_packages('temp.R')
unlink('temp.R')



