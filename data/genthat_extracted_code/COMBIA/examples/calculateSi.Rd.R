library(COMBIA)


### Name: calculateSi
### Title: Calculates survival indices (S.Is) for a range of wells
###   (casewells). S.Is for a range of wells are calculated, that range is
###   specified at the third place of wells argument list. This function
###   call the rangemean function to calculate the mean of the range of the
###   specified range. S.I is calculated by (Case well-
###   meanofemptyrange/mean of controlwell- meanofemptyrange). In the wells
###   argument one should provide arguments in the triplet form that is
###   first one is control data range, second one is the empty data range
###   while third one is the control range.
### Aliases: calculateSi

### ** Examples

 
f <- system.file("extdata", "optima.log", package="COMBIA")
fileDF <- readFile(filename = f, separator = "\t", noofrows_skip=0,
                    platetype="384") 
Generatedbarcode <- extractKey(keyposition = 2,
                            rawdata = fileDF, numberofrowsperplate = 17, 
                            doubleplateexperiment=TRUE) 
hashedplates <-  selectPlate(rawdata = fileDF,
                            processedbarcode = Generatedbarcode, 
                            numberofrowsperplate = 17,
                            selectionkey = "65000", 
                            doubleplateexperiment = TRUE  )
survivalindeces <- calculateSi(hashedplates = hashedplates, 
                                platekey = "7051", platetype = "384",rowsperexperiment=1,
                                wells = c( "c8:h8","c1:n1","c3:c7",    "c8:h8","c1:n1","c9:c11", 
                                "c8:h8","c1:n1","e3:e7",     "c8:h8","c1:n1","e9:e11",
                                "c8:h8","c1:n1","g3:g7",     "c8:h8","c1:n1","g9:g11") 
                              )    



