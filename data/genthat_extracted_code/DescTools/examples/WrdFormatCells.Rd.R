library(DescTools)


### Name: WrdFormatCells
### Title: Format Cells Of a Word Table
### Aliases: WrdFormatCells
### Keywords: print

### ** Examples

## Not run: 
##D    # Windows-specific example
##D 
##D m <- matrix(rnorm(12)*100, nrow=4,
##D             dimnames=list(LETTERS[1:4], c("Variable","Value","Remark")))
##D 
##D wrd <- GetNewWrd()
##D wt <- ToWrd(m)
##D 
##D WrdFormatCells(wt, rstart=c(3,1), rend=c(4,3),
##D                bg=wdConst$wdColorGold, font=list(name="Arial Narrow", bold=TRUE),
##D                align="c", border=list(color=wdConst$wdColorTeal,
##D                                       linewidth=wdConst$wdLineWidth300pt))
##D 
## End(Not run)



