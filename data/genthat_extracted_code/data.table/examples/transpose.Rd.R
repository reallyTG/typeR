library(data.table)


### Name: transpose
### Title: Efficient transpose of list
### Aliases: transpose
### Keywords: data

### ** Examples

ll = list(1:5, 6:8)
transpose(ll)
setDT(transpose(ll, fill=0))[]

DT = data.table(x=1:5, y=6:10)
transpose(DT)



