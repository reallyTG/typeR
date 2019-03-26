library(qmethod)


### Name: import.q.concourse
### Title: Q methodology: import concourse of Q items
### Aliases: import.q.concourse

### ** Examples

## Import a full q concourse from 'importexample' dataset
path.concourse <- paste(            # this part is only for the example!
  path.package("qmethod"),          # just to make sure, use absolute path
  # import example files are in root/extdata of package
  "/extdata/importexample/sample/concourse/",  # location of concourse
  sep = ""
  )
q.concourse <- import.q.concourse(  # import concourse
  q.concourse.dir = path.concourse, # insert your applicable path here
  languages = c("english","german") # choose your languages from path here
  )




