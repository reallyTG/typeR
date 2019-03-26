library(SSrat)


### Name: readratdatafixed
### Title: Reads the ratings of a group of raters from a specified textfile
###   into a SSrat compliant dataframe
### Aliases: readratdatafixed
### Keywords: datasets

### ** Examples


#example file names
filenames = c("example1.rat.txt","example2.rat.txt","example3.rat.txt",
              "example4.rat.txt","example5.rat.txt","example6.rat.txt",
              "example7.rat.txt","example1a.rat.txt","klas2.rat.txt")
filenames=paste(path.package("SSrat"),"/extdata/",filenames, sep="") 

# show raw text file
cat( readLines( filenames[1] ) , sep = "\n" )
              
#single group, no names, standard positions
(example1.rat = readratdatafixed(filenames[1]))
(example2.rat = readratdatafixed(filenames[2])) # raters < assessed
(example3.rat = readratdatafixed(filenames[3])) # raters > assessed
(example4.rat = readratdatafixed(filenames[4], rowsEQassessors = FALSE)) # raters in columns
(example5.rat = readratdatafixed(filenames[5]))


#multiple groups
(example6.rat = readratdatafixed(filenames[6]))
(example7.rat = readratdatafixed(paste(filenames[7])))

#single groups, with names: define positions
(example1a.rat = readratdatafixed(filenames[8], 
                           pnames=c(1,10), 
                           pschoolid=c(11,12), pgroupid=c(13,14),
                           prespid=c(15,16), pratings=c(18,27)))
(klas2.rat = readratdatafixed(filenames[9], 
                            pnames=c(10,20), 
                            pschoolid=c(1,2), pgroupid=c(3,4),
                            prespid=c(5,6), pratings=c(21,32)))




