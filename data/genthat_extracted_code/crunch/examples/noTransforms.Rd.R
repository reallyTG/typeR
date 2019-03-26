library(crunch)


### Name: noTransforms
### Title: Remove transformations from a CrunchCube
### Aliases: noTransforms

### ** Examples

## Not run: 
##D # A CrunchCube with a heading and subtotals
##D crtabs(~opinion, ds)
##D #               All opinions
##D #             Strongly Agree 23
##D #             Somewhat Agree 24
##D #                      Agree 47
##D # Neither Agree nor Disagree 18
##D #          Somewhat Disagree 16
##D #          Strongly Disagree 19
##D #                   Disagree 35
##D 
##D noTransforms(crtabs(~opinion, ds))
##D #             Strongly Agree             Somewhat Agree Neither Agree nor Disagree
##D #                         23                         24                         18
##D #          Somewhat Disagree          Strongly Disagree
##D #                         16                         19
## End(Not run)




