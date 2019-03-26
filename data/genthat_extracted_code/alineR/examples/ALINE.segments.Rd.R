library(alineR)


### Name: ALINE.segments
### Title: Similarity scores of aligned segments
### Aliases: ALINE.segments
### Keywords: Similarity Score alignment

### ** Examples

  # align words
  result<-raw.alignment(c("watu","dat"))
  
  # print the alignment followed by the sim score 
  # for each pair of aligned segments
  cat(result[[3]],result[[4]],sep='\n') 
  ALINE.segments(result)




