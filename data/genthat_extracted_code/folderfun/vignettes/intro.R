## ---- echo=FALSE---------------------------------------------------------
# These settings make the vignette prettier
knitr::opts_chunk$set(results="hold", collapse=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  # Load our data:
#  input1 = read.table("/long/and/annoying/hard/coded/path/data.txt")
#  input2 = read.table("/long/and/annoying/hard/coded/path/data2.txt")
#  output1 = processData(input)
#  output2 = processData2(input2)
#  
#  # Run other analysis...
#  
#  # Now write results:
#  write.table("/different/long/annoying/hard/coded/path/result.txt", output1)
#  write.table("/different/long/annoying/hard/coded/path/result2.txt", output2)

## ---- eval=FALSE---------------------------------------------------------
#  inputDir = "/long/and/annoying/hard/coded/path"
#  outputDir = "/different/long/annoying/hard/coded/path"
#  
#  input1 = read.table(file.path(inputDir, "data.txt"))
#  input2 = read.table(file.path(inputDir, "data2.txt"))
#  output1 = processData(input)
#  output2 = processData2(input2)
#  
#  # Run other analysis...
#  
#  write.table(file.path(outputDir, "result.txt"))
#  write.table(file.path(outputDir, "result2.txt"))

## ------------------------------------------------------------------------
library(folderfun)
setff("In", "/long/and/annoying/hard/coded/path/")
setff("Out", "/different/long/annoying/hard/coded/path/")

## ------------------------------------------------------------------------
ffIn("data.txt")
ffOut("result.txt")

## ---- eval=FALSE---------------------------------------------------------
#  input1 = read.table(ffIn("data.txt"))
#  input2 = read.table(ffIn("data2.txt"))
#  output1 = processData(input)
#  output2 = processData2(input2)
#  
#  # Run other analysis...
#  
#  write.table(ffOut("result.txt"))
#  write.table(ffOut("result2.txt"))

## ----include=FALSE-------------------------------------------------------
Sys.setenv(INDIR="/long/and/annoying/hard/coded/path/")
Sys.setenv(OUTDIR="/different/long/annoying/hard/coded/path/")

## ------------------------------------------------------------------------
options(INDIR="/long/and/annoying/path/to/hard/coded/file/")
options(OUTDIR="/different/long/annoying/hard/coded/path/")

## ------------------------------------------------------------------------
setff("In", Sys.getenv("INDIR"))
setff("Out", Sys.getenv("OUTDIR"))

ffIn()
ffIn("data.txt")

## ------------------------------------------------------------------------
setff("In", getOption("INDIR"))
setff("Out", getOption("OUTDIR"))

ffIn()
ffIn("data.txt")

## ---- eval=FALSE---------------------------------------------------------
#  setff("In", pathVar="INDIR")

## ---- eval=FALSE---------------------------------------------------------
#  setff("Indir")

## ---- echo=FALSE---------------------------------------------------------
# We should populate this variable to use it in the next section
options(DATA="/long/and/annoying/path/to/hard/coded/file/")

## ------------------------------------------------------------------------
projectName="myproject"
setff("Data", pathVar="DATA", postpend=projectName)

## ------------------------------------------------------------------------
projectName="myproject"
setff("Data", postpend=projectName)

## ------------------------------------------------------------------------
listff()

## ---- eval=FALSE---------------------------------------------------------
#  name = "DUMMYTESTVAR"
#  value = "test_value"
#  
#  optOrEnvVar(name)                 # NULL
#  Sys.setenv(name, value)
#  optOrEnvVar(name)                 # Now resolves
#  Sys.unsetenv(name)
#  
#  optOrEnvVar(name)                 # NULL
#  optArg = list(value)
#  names(optArg) = name
#  options(optArg)
#  optOrEnvVar(name)                 # Now resolves
#  
#  Sys.setenv(name, "new?")
#  optOrEnvVar(name)                 # on name collision, option trumps environment variable.

