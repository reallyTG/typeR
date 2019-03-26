library(qmethod)


### Name: build.q.set
### Title: Q methodology: sample a Q set from a concourse
### Aliases: build.q.set

### ** Examples

# Build a Q Set from a concourse and a sample
data(importexample)
q.set <- build.q.set(
  q.concourse = importexample$q.concourse,  # as created by import.q.concourse
  q.sample = c("life-with-q","q-uprising","r-dominance","small-village"),
  # add vector with items to be selected from concourse
  # q.sample is ideally read in from a separate *.CSV file
  q.distribution = c(1,2,1) # very simple distribution
  )



