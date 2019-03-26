library(seqminer)


### Name: writeWorkflow
### Title: Export workflow to Makefile
### Aliases: writeWorkflow

### ** Examples

j1 <- newJob('id1', 'cmd out1', 'out1')
j2 <- newJob('id2', 'cmd out2', 'out2', depend = 'out1')
w <- newWorkflow("wf")
w <- addJob(w, j1)
w <- addJob(w, j2)
writeWorkflow(w, "Makefile")



