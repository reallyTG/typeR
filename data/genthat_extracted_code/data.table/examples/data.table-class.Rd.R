library(data.table)


### Name: data.table-class
### Title: S4 Definition for data.table
### Aliases: class:data.table data.table-class
### Keywords: classes methods

### ** Examples

## Used in inheritence.
setClass('SuperDataTable', contains='data.table')

## Used in a slot
setClass('Something', representation(x='character', dt='data.table'))
x <- new("Something", x='check', dt=data.table(a=1:10, b=11:20))



