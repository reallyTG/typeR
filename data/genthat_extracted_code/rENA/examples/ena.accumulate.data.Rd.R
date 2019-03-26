library(rENA)


### Name: ena.accumulate.data
### Title: Accumulate data from a data frame into a set of adjacency
###   (co-occurrence) vectors
### Aliases: ena.accumulate.data
### Keywords: accumulate data,

### ** Examples

data(RS.data)

codeNames = c('Data','Technical.Constraints','Performance.Parameters',
  'Client.and.Consultant.Requests','Design.Reasoning','Collaboration');

accum = ena.accumulate.data(
  units = RS.data[,c("UserName","Condition")],
  conversation = RS.data[,c("Condition","GroupName")],
  metadata = RS.data[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post")],
  codes = RS.data[,codeNames],
  window.size.back = 4
)




