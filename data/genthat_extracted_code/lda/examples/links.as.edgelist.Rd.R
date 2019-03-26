library(lda)


### Name: links.as.edgelist
### Title: Convert a set of links keyed on source to a single list of
###   edges.
### Aliases: links.as.edgelist
### Keywords: utilities

### ** Examples

## Take the citations for the first few documents of Cora.
data(cora.cites)

links <- cora.cites[1:5]
links
## [[1]]
## [1] 484 389

## [[2]]
## integer(0)

## [[3]]
## integer(0)

## [[4]]
## [1] 177 416 533

## [[5]]
## [1] 153

links.as.edgelist(links)
##      [,1] [,2]
## [1,]    1  485
## [2,]    1  390
## [3,]    4  178
## [4,]    4  417
## [5,]    4  534
## [6,]    5  154



