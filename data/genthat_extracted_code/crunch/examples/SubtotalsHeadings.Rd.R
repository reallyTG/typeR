library(crunch)


### Name: Subtotal-class
### Title: Subtotals and headings
### Aliases: Subtotal-class Subtotal Heading-class Heading
###   SubtotalsHeadings subtotals subtotals<- is.Subtotal is.Heading
###   are.Subtotals are.Headings subtotals,CrunchVariable-method
###   subtotals,VariableTuple-method subtotals<-,CrunchVariable,ANY-method
###   subtotals<-,CrunchVariable,NULL-method

### ** Examples

## Not run: 
##D # given a variable ds$opinion, with categories: Strongly Agree, Somewhat
##D # Agree, Neither Agree nor Disagree, Somewhat Disagree, and Strongly Disagree,
##D # to make two subtotals for Agree and Disagree:
##D subtotals(ds$opinion) <- list(
##D     Subtotal(name = "Agree",
##D              categories = c("Strongly Agree", "Somewhat Agree"),
##D              after = "Somewhat Agree"),
##D     Subtotal(name = "Disagree",
##D              categories = c("Strongly Disagree", "Somewhat Disagree"),
##D              after = "Strongly Disagree")
##D )
##D 
##D # headings can also be added:
##D subtotals(ds$opinion) <- Heading(name = "All opinions", position = "top")
##D 
##D # to see the subtotals and headings associated with a variable
##D subtotals(ds$opinion)
##D #        anchor         name     func    args
##D # 1      2        Agree subtotal 1 and 2
##D # 2      4     Disagree subtotal 4 and 5
##D # 3      0 All opinions     <NA>      NA
##D 
##D # when you use a variable with subtotals and headings in a cube, you see them
##D # by default
##D opinion_cube <- crtabs(~opinion, ds)
##D opinion_cube
##D #               All opinions
##D #             Strongly Agree 23
##D #             Somewhat Agree 24
##D #                      Agree 47
##D # Neither Agree nor Disagree 18
##D #          Somewhat Disagree 16
##D #          Strongly Disagree 19
##D #                   Disagree 35
##D 
##D 
##D # to get just the subtotals,
##D subtotalArray(opinion_cube)
##D #    Agree Disagree
##D #       47       35
##D 
##D # to remove all subtotals and headings
##D subtotals(ds$opinion) <- NULL
##D crtabs(~opinion, ds)
##D #             Strongly Agree 23
##D #             Somewhat Agree 24
##D # Neither Agree nor Disagree 18
##D #          Somewhat Disagree 16
##D #          Strongly Disagree 19
##D 
##D # if you want to temporarily remove subtotals and headings, you can with `noTransforms`
##D noTransforms(crtabs(~opinion, ds))
##D #             Strongly Agree             Somewhat Agree Neither Agree nor Disagree
##D #                         23                         24                         18
##D #          Somewhat Disagree          Strongly Disagree
##D #                         16                         19
## End(Not run)




