library(bfw)


### Name: SumToZero
### Title: Sum to Zero
### Aliases: SumToZero

### ** Examples

 data <- matrix(c(1,2),ncol=2)
 colnames(data) <- c("m1[1]","m1[2]")
 SumToZero( 2 , data , contrasts = NULL )
 #               b0[1] b1[1] b1[2]
 #       m1[1]   1.5  -0.5   0.5



