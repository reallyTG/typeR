library(stm)


### Name: prepDocuments
### Title: Prepare documents for analysis with 'stm'
### Aliases: prepDocuments

### ** Examples

temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
meta<-temp$meta
vocab<-temp$vocab
docs<-temp$documents
out <- prepDocuments(docs, vocab, meta)



