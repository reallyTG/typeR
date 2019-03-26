library(crunch)


### Name: subtotalArray,CrunchCube-method
### Title: Calculate the transforms from a CrunchCube
### Aliases: subtotalArray,CrunchCube-method applyTransforms subtotalArray

### ** Examples

## Not run: 
##D # to get an array of just the subtotals
##D subtotalArray(crtabs(~opinion, ds))
##D #    Agree Disagree
##D #       47       35
##D 
##D # to get the full array with the subtotals but not headings
##D applyTransforms(crtabs(~opinion, ds), include = c("cube_cells", "subtotals"))
##D #             Strongly Agree             Somewhat Agree                      Agree
##D #                         23                         24                         47
##D # Neither Agree nor Disagree          Strongly Disagree                   Disagree
##D #                         18                         19                         35
##D #          Somewhat Disagree
##D #                         16
##D # to get the full array with the headings but not subtotals
##D applyTransforms(crtabs(~opinion, ds), include = c("cube_cells", "headings"))
##D #               All opinions             Strongly Agree             Somewhat Agree
##D #                         NA                         23                         24
##D # Neither Agree nor Disagree          Strongly Disagree          Somewhat Disagree
##D #                         18                         19                         16
## End(Not run)




