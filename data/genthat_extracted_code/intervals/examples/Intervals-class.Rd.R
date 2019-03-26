library(intervals)


### Name: Intervals-class
### Title: Classes "Intervals" and "Intervals_full"
### Aliases: Intervals Intervals_full Intervals-class Intervals_full-class
###   [,Intervals-method [,Intervals_full-method
###   [<-,Intervals,ANY,missing,Intervals_virtual-method
###   [<-,Intervals_full,ANY,missing,Intervals_virtual-method closed<-
###   closed<-,Intervals-method closed<-,Intervals_full-method
###   coerce,Intervals,Intervals_full-method
###   coerce,Intervals_full,Intervals-method initialize,Intervals-method
###   initialize,Intervals_full-method
### Keywords: classes

### ** Examples


# The "Intervals" class

i <- Intervals(
               matrix(
                      c(1,2,  
                        3,5,
                        4,6,
                        8,9
                        ),
                      byrow = TRUE,
                      ncol = 2
               ),
               closed = c( TRUE, TRUE ),
               type = "Z"
               )

# Row subsetting preserves class. Column subsetting causes coercion to
# "matrix" class. 

i
i[1:2,]
i[,1:2]

# Full endpoint control

j <- as( i, "Intervals_full" )
closed(j)[ 3:4, 2 ] <- FALSE
closed(j)[ 4, 1 ] <- FALSE
j

# Rownames may be used

rownames(j) <- c( "apple", "banana", "cherry", "date" )
j

# Assignment preserves class, coercing if necessary

j[2:3] <- i[1:2,]
j




