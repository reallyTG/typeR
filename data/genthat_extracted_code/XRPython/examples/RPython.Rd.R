library(XRPython)


### Name: RPython
### Title: An Evaluator for the Python Interface.
### Aliases: RPython

### ** Examples

if(okPython(TRUE)) {
  ev <- RPython()
  xx <- ev$Eval("[1, %s, 5]", pi)
  xx
  xx$append(4.5)
  ev$Command("print %s", xx)
}



