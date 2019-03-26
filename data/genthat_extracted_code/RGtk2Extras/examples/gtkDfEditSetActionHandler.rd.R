library(RGtk2Extras)


### Name: gtkDfEditSetActionHandler
### Title: Setting user defined functions on the editor
### Aliases: gtkDfEditSetActionHandler

### ** Examples


win = gtkWindowNew("gtkDfEdit Demo")
obj <- gtkDfEdit(iris)
win$add(obj)
win$show()

obj$setActionHandler("ChangeCells", 
  handler=function(obj, nf, row.idx, col.idx, do.coercion)
   print(paste("Cells changed at R", 
if(!missing(row.idx)) row.idx, ", C", 
if(!missing(col.idx)) col.idx, sep="")))

obj$setActionHandler("SetFactorAttributes", 
handler=function(obj, col.idx, info) {
print(paste("factor changed at", col.idx, 
"new levels", paste(info$levels, 
collapse=", ")))
})

obj$setActionHandler("CoerceColumns", function(obj, theClasses, col.idx)
print(paste("columns", col.idx, 
"of", obj$getDatasetName(), "coerced to", 
theClasses)))

obj$setActionHandler("ChangeColumnNames", 
function(obj, theNames, col.idx) {
print(paste("column names at", col.idx, 
"changed to", theNames))
})

obj$setActionHandler("ChangeRowNames", function(obj, theNames, row.idx) {
print(paste("row names at", row.idx, 
"changed to", theNames))
})

obj$setActionHandler("DeleteRows", function(obj, row.idx) {
print(paste("rows at", row.idx, "deleted"))
})


obj$setActionHandler("InsertRows", function(obj, nf, row.idx) {
print(paste("rows inserted at", row.idx))
print(nf)
})

obj$setActionHandler("InsertNARows", function(df, row.idx) {
print(paste("rows inserted at", row.idx))
})


obj$setActionHandler("DeleteColumns", function(obj, col.idx) {
print(paste("columns at", col.idx, "deleted"))
})

obj$setActionHandler("InsertColumns", function(obj, nf, col.idx) {
print(paste("cols inserted at", col.idx))
})

obj$setActionHandler("InsertNAColumns", function(obj, nf, col.idx, 
  NA.opt) { print(paste("cols inserted at", col.idx))
})

obj$setActionHandler("Selection", function(obj, row.idx, col.idx) {
  print(paste(paste(length(row.idx), "R", sep=""), 
"x", paste(length(col.idx), 
"C", sep="")))
})

obj$setActionHandler("RowClicked", function(obj, idx) print(obj[idx,]))

obj$setActionHandler("ColumnClicked", function(idx, data) 
  print(obj[,idx]))



