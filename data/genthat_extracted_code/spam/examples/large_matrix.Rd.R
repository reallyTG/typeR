library(spam)


### Name: large_matrix
### Title: Large 64-bit matrices require the R package 'spam64'
### Aliases: large_matrix 'large matrix' large_matries 'large matries'
###   64bit 64bits 'long vector' 'long vectors' spam64
### Keywords: array algebra

### ** Examples

## Not run: 
##D ## the following matrices are very large, and hence, 
##D ## require much memory and cpu time.
##D library("spam64")
##D s1 <- spam(1, ncol=2^30)        # 32-bit matrix
##D s1
##D 
##D s2 <- cbind(s1, s1)             # 64-bit matrix
##D s2
##D 
##D s3 <- spam(1, ncol=2^31)        # 64-bit matrix
##D s3
## End(Not run)



