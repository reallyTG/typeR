library(insect)


### Name: conversion
### Title: Convert sequences between binary and character string formats.
### Aliases: conversion dna2char aa2char char2dna char2aa

### ** Examples

  char2dna("TAACGC")
  char2aa("VGAHAGEY")
  dna2char(char2dna("TAACGC"))
  aa2char(char2aa("VGAHAGEY"))
  char2dna(list(seq1 = "TAACGC", seq2 = "ATTGCG"))
  char2aa(list(seq1 = "VGAHAGEY", seq2 = "VNVDEV"))



