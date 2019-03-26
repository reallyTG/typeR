library(stm)


### Name: make.heldout
### Title: Heldout Likelihood by Document Completion
### Aliases: make.heldout eval.heldout

### ** Examples


prep <- prepDocuments(poliblog5k.docs, poliblog5k.voc,
                      poliblog5k.meta,subsample=500,
                      lower.thresh=20,upper.thresh=200)
heldout <- make.heldout(prep$documents, prep$vocab)
documents <- heldout$documents
vocab <- heldout$vocab
meta <- prep$meta

stm1<- stm(documents, vocab, 5,
           prevalence =~ rating+ s(day),
           init.type="Random",
           data=meta, max.em.its=5)
eval.heldout(stm1, heldout$missing)




