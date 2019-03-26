library(data.table)


### Name: truelength
### Title: Over-allocation access
### Aliases: truelength alloc.col
### Keywords: data

### ** Examples

DT = data.table(a=1:3,b=4:6)
length(DT)                 # 2 column pointer slots used
truelength(DT)             # 1026 column pointer slots allocated
alloc.col(DT,2048)
length(DT)                 # 2 used
truelength(DT)             # 2050 allocated, 2048 free
DT[,c:=7L]                 # add new column by assigning to spare slot
truelength(DT)-length(DT)  # 2047 slots spare



