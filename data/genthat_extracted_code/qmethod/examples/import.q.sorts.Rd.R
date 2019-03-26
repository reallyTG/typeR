library(qmethod)


### Name: import.q.sorts
### Title: Q methodology: import Q-sorts from CSV
### Aliases: import.q.sorts

### ** Examples

## Import a Q sample from a directory of *.CSV files
data(importexample)
path.sorts <- paste(                 # this part is only for the example!
  path.package("qmethod"),           # just to make sure, use absolute path
  # import example files are in root/extdata of package:
  "/extdata/importexample/qsorts/",  # location of sorts
  sep = ""
  )
q.sorts <- import.q.sorts(           # now import the sorts
  q.sorts.dir = path.sorts,          # add your path here
  q.set = importexample$q.set,       # as produced by build.q.set
  q.distribution = c(1,2,1),         # very simple distribution
  conditions = c("before","after"),  # enter your conditions here, same as in path
  manual.lookup = matrix(  # ideally empty for automatic hashing, 
                           # or read in from *.CSV file
    c("i01","i02","i03","i04"),
    ncol = 1,
    nrow = 4,
    dimnames = list(c("r-dominance","q-uprising","small-village",
                      "life-with-q"),"ID")
    )
  )



