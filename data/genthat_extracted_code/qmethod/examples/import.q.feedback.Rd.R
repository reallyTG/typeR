library(qmethod)


### Name: import.q.feedback
### Title: Q methodology: imports feedback on Q items
### Aliases: import.q.feedback

### ** Examples

data(importexample)
path.feedback <- paste(            # this part is only for the example!
  path.package("qmethod"),         # just to make sure, use absolute path
  # import example files are in root/extdata of package:
  "/extdata/importexample/feedback/",  # location of sorts
  sep = ""
  )
q.feedback <- import.q.feedback(   # now import the feedback
  q.feedback.dir = path.feedback,  # add your path here
  q.sorts = importexample$q.sorts,
  q.set = importexample$q.set,     # as produced by build.q.set
  manual.lookup = matrix(  # ideally empty for automatic hashing, or read in from *.CSV
    c("i01","i02","i03","i04"),
    ncol = 1,
    nrow = 4,
    dimnames = list(c("r-dominance","q-uprising","small-village","life-with-q"),"ID")
    )
  )



