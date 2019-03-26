## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(GeneticSubsetter)

## ----genotypes-----------------------------------------------------------
library(GeneticSubsetter)
data(genotypes)
genotypes[1:10,1:6]
a<-CoreSetter(genos=genotypes,criterion="HET", save=c("Genotype 1","Genotype 5","Genotype 9"))

## ----CoreSetter----------------------------------------------------------
print(a)

## ----genotypes.poly------------------------------------------------------
library(GeneticSubsetter)
data(genotypes)
genotypes.poly[1:10,1:6]
a<-CoreSetterPoly(genotypes.poly,ploidy=2,save=c("Genotype 1","Genotype 5","Genotype 9"))

