library(COMBIA)


### Name: readFluostarPlates
### Title: Read a file and process it to calculate the Survival
###   indeces(S.I). This function calls other functions to complete its
###   task. It reads a file to separate and regenerate the missing
###   platekeys.  Checks are performed to keep regenerated missing
###   keyvalues in sync with data. It calculates survival indeces of the
###   provided control wells, where wells should always be in triplet form
###   that is control well range, empty well range and case well range. It
###   can also handle the double plate experiments in which one plate is
###   read twice and only one of them is selected in S.I calculations.
###   Secondly it can also read the data from the file where a plate is
###   read only one time, still it cope with variations if an experiment is
###   repeated twice or many time in adjacent rows in the file.
### Aliases: readFluostarPlates

### ** Examples

f <- system.file("extdata", "optima.log", package = "COMBIA")
platematrix <- readFluostarPlates(filename = f, platetype = "384", 
                                   keyposition=2, separator= "\t",     
                                   selectionkey = "65000", platekey = 7051,
wells = c( "c8:h8","c1:n1","c3:c7",    "c8:h8","c1:n1","c9:c11", 
           "c8:h8","c1:n1","e3:e7",     "c8:h8","c1:n1","e9:e11",
           "c8:h8","c1:n1","g3:g7",     "c8:h8","c1:n1","g9:g11" )
                                 )



