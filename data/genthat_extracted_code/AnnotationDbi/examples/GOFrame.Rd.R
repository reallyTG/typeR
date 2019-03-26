library(AnnotationDbi)


### Name: GOFrame
### Title: GOFrame and GOAllFrame objects
### Aliases: GOFrame class:GOFrame GOFrame-class GOAllFrame
###   class:GOAllFrame GOAllFrame-class GOFrame
###   GOFrame,data.frame,character-method GOFrame,data.frame,missing-method
###   GOAllFrame GOAllFrame,GOFrame-method getGOFrameData
###   getGOFrameData,GOFrame-method getGOFrameData,GOAllFrame-method
### Keywords: classes interface

### ** Examples

  ## Make up an example
  genes = c(1,10,100)
  evi = c("ND","IEA","IDA")
  GOIds = c("GO:0008150","GO:0008152","GO:0001666")
  frameData = data.frame(cbind(GOIds,evi,genes))

  library(AnnotationDbi)
  frame=GOFrame(frameData,organism="Homo sapiens")
  allFrame=GOAllFrame(frame)

  getGOFrameData(allFrame)



