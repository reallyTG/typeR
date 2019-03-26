library(gplots)


### Name: venn
### Title: Plot a Venn diagram
### Aliases: venn plot.venn
### Keywords: hplot

### ** Examples


##
## Example using a list of item names belonging to the
## specified group.
##

## construct some fake gene names..
oneName <- function() paste(sample(LETTERS,5,replace=TRUE),collapse="")
geneNames <- replicate(1000, oneName())

##
GroupA <- sample(geneNames, 400, replace=FALSE)
GroupB <- sample(geneNames, 750, replace=FALSE)
GroupC <- sample(geneNames, 250, replace=FALSE)
GroupD <- sample(geneNames, 300, replace=FALSE)
input  <-list(GroupA,GroupB,GroupC,GroupD)
input

tmp <- venn(input)
attr(tmp, "intersections")

##
## Example using a list of item indexes belonging to the
## specified group.
##
GroupA.i <- which(geneNames %in% GroupA)
GroupB.i <- which(geneNames %in% GroupB)
GroupC.i <- which(geneNames %in% GroupC)
GroupD.i <- which(geneNames %in% GroupD)
input.i  <-list(A=GroupA.i,B=GroupB.i,C=GroupC.i,D=GroupD.i)
input.i

venn(input.i)

##
## Example using a data frame of indicator ('f'lag) columns
##
GroupA.f <- geneNames %in% GroupA
GroupB.f <- geneNames %in% GroupB
GroupC.f <- geneNames %in% GroupC
GroupD.f <- geneNames %in% GroupD
input.df <- data.frame(A=GroupA.f,B=GroupB.f,C=GroupC.f,D=GroupD.f)
head(input.df)
venn(input.df)

## smaller set to create empty groupings
small <- input.df[1:20,]

venn(small, simplify=FALSE) # with empty groupings
venn(small, simplify=TRUE)  # without empty groupings

## Capture group counts, but don't plot
tmp <- venn(input, show.plot=FALSE)
tmp

## Show internal binary group labels
venn(input, showSetLogicLabel=TRUE)

## Limit  universe
tmp <- venn(input, universe=geneNames[1:100])
tmp

##
## Example to determine which elements are in A and B but not in
## C and D using the 'intersections' attribute.
##
tmp <- venn(input, intersection=TRUE)
isect <- attr(tmp, "intersection")

# Look at all of the subsets
str(isect)

# Extract and combine the subsets of interest..
AandB <- unique(c(isect$A, isect$B, isect$'A:B'))

# and look at the results
str(AandB)

##
## The full set of elements of each intersection is provided in the
## "interesections" attribute.
##
a<-venn(list(1:5,3:8), show.plot=FALSE)
intersections<-attr(a,"intersections")
print(intersections)
# $A
# [1] "1" "2"
#
# $B
# [1] "6" "7" "8"
#
# $`A:B`
# [1] "3" "4" "5"



