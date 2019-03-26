library(AnnotationDbi)


### Name: KEGGFrame
### Title: KEGGFrame objects
### Aliases: KEGGFrame class:KEGGFrame KEGGFrame-class KEGGFrame
###   KEGGFrame,data.frame,character-method
###   KEGGFrame,data.frame,missing-method getKEGGFrameData
###   getKEGGFrameData,KEGGFrame-method
###   getKEGGFrameData,KEGGAllFrame-method
### Keywords: classes interface

### ** Examples

  ## Make up an example
  genes = c(2,9,9,10)
  KEGGIds = c("04610","00232","00983","00232")
  frameData = data.frame(cbind(KEGGIds,genes))

  library(AnnotationDbi)
  frame=KEGGFrame(frameData,organism="Homo sapiens")

  getKEGGFrameData(frame)



