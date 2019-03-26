library(StereoMorph)


### Name: orthogonalProjectionToLine
### Title: Finds the orthogonal projection of a point onto a line
### Aliases: orthogonalProjectionToLine
### Keywords: lines

### ** Examples

## POINT INPUT: 2D VECTOR
## LINE INPUT: l1, l2
## LINE THROUGH THE ORIGIN WITH SLOPE OF ONE
orthogonalProjectionToLine(p=c(0, 5), l1=c(0, 0), l2=c(3, 3))

## POINT INPUT: 2D VECTOR
## LINE INPUT: LIST WITH l1, l2
orthogonalProjectionToLine(p=c(0, 5), l1=list(l1=c(0, 0), l2=c(3, 3)))

## POINT INPUT: 2D VECTOR
## LINE INPUT: LIST WITH m, b
## LINE WITH Y-INTERCEPT AT ONE AND SLOPE OF ONE
orthogonalProjectionToLine(p=c(0, 5), l1=list(m=1, b=0))

## POINT INPUT: 2D VECTOR
## LINE INPUT: LIST WITH VECTOR PARALLEL TO LINE THROUGH THE ORIGIN
## LINE THROUGH THE ORIGIN WITH SLOPE OF ONE
orthogonalProjectionToLine(p=c(0, 5), l1=list(a=1, b=-1, c=0))

## POINT INPUT: 2D VECTOR
## LINE INPUT: SAME AS PREVIOUS BUT WITH Z-AXIS COMPONENT
orthogonalProjectionToLine(p=c(0, 5), l1=list(a=1, b=-1, c=1))

## POINT INPUT: 3D VECTOR
## LINE INPUT: l1, l2
orthogonalProjectionToLine(p=c(0, 5, 0), l1=list(l1=c(0, 0, 0), l2=c(3, 3, 3)))

## POINT INPUT: 2D MATRIX
## LINE INPUT: l1, l2
p <- matrix(c(0,5, 0,10), nrow=2, byrow=TRUE)
orthogonalProjectionToLine(p=p, l1=list(l1=c(0, 0), l2=c(3, 3)))

## POINT INPUT: 3D MATRIX
## LINE INPUT: l1, l2
p <- matrix(c(0,5,0, 0,10,0), nrow=2, byrow=TRUE)
orthogonalProjectionToLine(p=p, l1=list(l1=c(0, 0, 0), l2=c(3, 3, 3)))



