library(Aoptbdtvc)


### Name: aoptgdtd
### Title: A-optimal group divisible treatment designs
### Aliases: aoptgdtd
### Keywords: group divisible treatment design A-optimal

### ** Examples

## construct an A-optimal GDT design with 12 (= 4 x 3) test treatments 
##in 12 blocks each of size 6
aoptgdtd(m=4,n=3,b=12,k=6)
## construct an A-optimal GDT design with 8 (= 4 x 2) test treatments 
##in 8 blocks each of size 4
aoptgdtd(m=4,n=2,b=8,k=4)
##design does not exist
aoptgdtd(4,2,8,2)
##Design not found
## Not run: aoptgdtd(3,3,15,3)



