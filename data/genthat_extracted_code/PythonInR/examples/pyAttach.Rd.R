library(PythonInR)


### Name: pyAttach
### Title: Attach Python objects to R
### Aliases: pyAttach

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
if ( pyIsConnected() ){
pyExec("import os")

## attach to global
## ----------------
## attach the function getcwd from the module os to R.
pyAttach("os.getcwd", .GlobalEnv)
os.getcwd
os.getcwd()
## attach the string object os.name to R
pyAttach("os.name", .GlobalEnv)
pyExecp("os.name")
os.name
## Since os.name is attached to the globalenv it can be set without using
## the global assignment operator
os.name = "Hello Python from R!"
pyExecp("os.name")
os.name
## Please note if you don't pyAttach to globalenv you have to use 
## the global assignment operator to set the values of the Python objects

## attach to a new environment
## ---------------------------
os <- new.env()
attach(os, name="python:os")
pyAttach(paste("os", pyDir("os"), sep="."), as.environment("python:os"))
os.sep
os.sep = "new sep" ## this doesn't changes the value in Python but only 
                   ## assigns the new variable os.sep to globalenv
os.sep
.GlobalEnv$`os.sep`
as.environment("python:os")$`os.sep`
pyExecp("os.sep")
ls()
ls("python:os")
os.sep <<- "this changes the value in Python"
.GlobalEnv$`os.sep`
as.environment("python:os")$`os.sep`
pyExecp("os.sep")
}



