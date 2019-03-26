library(pks)


### Name: conversion
### Title: Conversion between Representations of Responses or States
### Aliases: conversion as.pattern as.binmat
### Keywords: models

### ** Examples

data(DoignonFalmagne7)
as.pattern(DoignonFalmagne7$K)
as.pattern(DoignonFalmagne7$K, freq = TRUE)
as.pattern(DoignonFalmagne7$K, as.letters = TRUE)
as.pattern(DoignonFalmagne7$K, as.set = TRUE)

dim(as.binmat(DoignonFalmagne7$N.R))
dim(as.binmat(DoignonFalmagne7$N.R, uniq = FALSE))

## Knowledge structure as binary matrix
as.binmat(c("000", "100", "101", "111"))
as.binmat(set(set(), set("a"), set("a", "c"), set("a", "b", "c")))



