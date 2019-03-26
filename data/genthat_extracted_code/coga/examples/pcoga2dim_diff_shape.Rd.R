library(coga)


### Name: pcoga2dim_diff_shape
### Title: Recurrence Identity of Shape Parameter for 'pcoga2dim'
### Aliases: pcoga2dim_diff_shape

### ** Examples

## these pairs give us the same results
pcoga2dim_diff_shape(3,2,4,5,4)
pcoga2dim(3,2,4,5,4) - pcoga2dim(3,3,4,5,4)

pcoga2dim_diff_shape(3,0,4,3,5)
pgamma(3,4,5) - pcoga2dim(3,1,4,3,5)

pcoga2dim_diff_shape(3,6,0,5,4)
pgamma(3,6,5) - pgamma(3,7,5)

pcoga2dim_diff_shape(3,0,0,4,5)
1 - pgamma(3,1,4)




