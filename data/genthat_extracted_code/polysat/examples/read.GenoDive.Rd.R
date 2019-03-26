library(polysat)


### Name: read.GenoDive
### Title: Import Genotype Data from GenoDive File
### Aliases: read.GenoDive
### Keywords: file

### ** Examples

# create data file (normally done in a text editor or spreadsheet software)
cat(c("example comment line", "5\t2\t2\t3\t2", "pop1", "pop2",
      "pop\tind\tloc1\tloc2", "1\tJohn\t102\t1214",
      "1\tPaul\t202\t0", "2\tGeorge\t101\t121213",
      "2\tRingo\t10304\t131414","1\tYoko\t10303\t120014"),
    file = "genodiveExample.txt", sep = "\n")

# import file data
exampledata <- read.GenoDive("genodiveExample.txt")

# view data
summary(exampledata)
viewGenotypes(exampledata)
exampledata



