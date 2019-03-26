library(LatticeKrig)


### Name: LKrig Miscellaneous Matrix Functions
### Title: Miscellaneous internal functions for LatticeKrig package.
### Aliases: LKrig.rowshift.periodic LKrig.shift.matrix LKArrayShift
###   LKrig.rowshift expandMList expandMatrix0 expandMatrix repMatrix
###   convertIndexPeriodic grid2Index convertIndexArray
### Keywords: spatial

### ** Examples

	A<- array( 1:90, c( 4,5,3))
	LKArrayShift( A, c( -1,-1,0))	
	
# welcome to the world of unrolling multiarray indices
A<- array( 1:60, c( 4,3,5))	
I<- rbind( c(1,2,1), c( 3,2,5))
look<- grid2Index( I, c( 4,3,5) )
# A has been filled with the right unrolled index
print( look)
print(A[look])



