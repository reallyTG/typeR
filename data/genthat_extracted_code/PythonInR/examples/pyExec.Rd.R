library(PythonInR)


### Name: pyExec
### Title: Executes multiple lines of Python code from within R
### Aliases: pyExec

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
pyExec('
print("The following line will not appear in the R terminal!")
"Hello" + " " + "R!"
print("NOTE: pyExecp would also show the line above!")
print("The following line will appear in the R terminal!")
print("Hello" + " " + "R!")
')



