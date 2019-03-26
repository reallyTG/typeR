library(rprime)


### Name: FrameList
### Title: Convert lines from an Eprime file into EprimeFrame objects
### Aliases: FrameList

### ** Examples

lines <- c("\t*** LogFrame Start ***",
           "\tProcedure: FamTask",
           "\titem1: bear",
           "\titem2: chair",
           "\tCorrectResponse: bear",
           "\tImageSide: Left",
           "\tDuration: 885",
           "\tFamiliarization: 1",
           "\tFamInforcer: 1",
           "\tReinforcerImage: Bicycle1",
           "\tFamiliarization.Cycle: 1",
           "\tFamiliarization.Sample: 1",
           "\tRunning: Familiarization",
           "\tFamTarget.RESP: ",
           "\tCorrect: True",
           "\t*** LogFrame End ***")
# List of 1
# $ :List of 17
# ..$ Eprime.Level      : num 2
# ..$ Eprime.LevelName  : chr "Familiarization_1"
# ..$ Eprime.Basename   : chr "NA"
# ..$ Eprime.FrameNumber: chr "1"
# ..$ Procedure         : chr "FamTask"
# ..$ Running           : chr "Familiarization"
# ..$ item1             : chr "bear"
# ..$ item2             : chr "chair"
# ..$ CorrectResponse   : chr "bear"
# ..$ ImageSide         : chr "Left"
# ..$ Duration          : chr "885"
# ..$ FamInforcer       : chr "1"
# ..$ ReinforcerImage   : chr "Bicycle1"
# ..$ Cycle             : chr "1"
# ..$ Sample            : chr "1"
# ..$ FamTarget.RESP    : chr ""
# ..$ Correct           : chr "True"
# ..- attr(*, "class")= chr [1:2] "EprimeFrame" "list"
# - attr(*, "class")= chr [1:2] "list" "FrameList"



