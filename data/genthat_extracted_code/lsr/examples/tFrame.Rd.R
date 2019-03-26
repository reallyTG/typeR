library(lsr)


### Name: tFrame
### Title: Transpose a data frame
### Aliases: tFrame

### ** Examples
# Create a data frame that could sensibly be transposed...	
Gf <- c(105, 119, 121, 98)   # fluid intelligence for 4 people
Gc <- c(110, 115, 119, 103)  # crystallised intelligence 
Gs <- c(112, 102, 108, 99)   # speed of processing
dataset <- data.frame( Gf, Gc, Gs ) 
rownames(dataset) <- paste( "person", 1:4, sep="" )
print(dataset)	

# Now transpose it...
tFrame( dataset )
	 	
	



