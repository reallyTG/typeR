library(tcR)


### Name: group.clonotypes
### Title: Get all unique clonotypes.
### Aliases: group.clonotypes

### ** Examples

## Not run: 
##D tmp <- data.frame(A = c('a','a','b','c', 'a')
##D B = c('V1', 'V1','V1','V2', 'V3')
##D C = c(10,20,30,40,50), stringsAsFactors = F)
##D tmp
##D #   A  B  C
##D # 1 a V1 10
##D # 2 a V1 20
##D # 3 b V1 30
##D # 4 c V2 40
##D # 5 a V3 50
##D group.clonotypes(tmp, 'B', 'C', 'A')
##D #  A  B  C
##D #  1 a V1 30
##D #  3 b V1 50
##D #  4 c V2 30
##D #  5 a V3 40
##D group.clonotypes(tmp, NA, 'C', 'A')
##D #   A  B  C
##D # 1 a V1 80
##D # 3 b V1 30
##D # 4 c V2 40
##D # For tcR data frame:
##D data(twb)
##D twb1.gr <- group.clonotypes(twb[[1]])
##D twb.gr <- group.clonotypes(twb)
## End(Not run)



