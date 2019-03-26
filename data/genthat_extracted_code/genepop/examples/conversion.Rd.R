library(genepop)


### Name: conversion
### Title: File conversions
### Aliases: conversion

### ** Examples

infile <- system.file('extdata', 'sample.txt',package='genepop')
locinfile <- 'sample.txt'
check <- file.copy(infile,locinfile,overwrite=TRUE)
conversion(locinfile, format='Fstat', 'sample.txt.DAT')



