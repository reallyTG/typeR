library(RGtk2Extras)


### Name: gtkDfEditDoTask
### Title: Editor change handling.
### Aliases: gtkDfEditDoTask

### ** Examples


win = gtkWindowNew("gtkDfEdit Demo")
obj <- gtkDfEdit(iris)
win$add(obj)
win$show()


task <- list(
  list(func="ChangeCells", 
    arg=list(nf=array(4, c(2,2)), row.idx=1:2, col.idx=1:2))
)

obj$doTask(task)

task <- list(
  list(func="InsertRows", 
     arg=list(nf=iris[1,], row.idx=1))
)
obj$doTask(task)
obj$undo()

task <- list(
  list(func="InsertColumns", 
     arg=list(nf=iris[,1], col.idx=1))
)

obj$doTask(task)
obj$undo()

task <- list(
  list(func="InsertNARows", arg=list(row.idx=2)),
  list(func="InsertNAColumns", arg=list(col.idx=2))
)

obj$doTask(task)
obj$undo()

task <- list(
  list(func="ChangeRowNames", 
     arg=list(theNames=c("hi", "there"), row.idx=1:2))
)

obj$doTask(task)

task <- list(
  list(func="ChangeColumnNames", 
arg=list(theNames=c("1", "2"), 
col.idx=2:3))
)

obj$doTask(task)

task <- list(
  list(func="CoerceColumns", 
    arg=list(theClasses = c("character", "integer"), col.idx=1:2))
)
obj$doTask(task)




