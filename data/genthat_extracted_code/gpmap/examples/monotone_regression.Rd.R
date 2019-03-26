library(gpmap)


### Name: monotone_regression
### Title: Perform monotone regression on a genotype-phenotype (GP) map
### Aliases: monotone_regression

### ** Examples

data(GPmaps)

#Additive GP map is monotone 
monotone_regression(A,c(2,2))

#Pure AxA epistasis map
monotone_regression(AA,c(2,2))

#two-locus example in Cheverud & Routman (1995)
monotone_regression(mouseweight,c(1,1))



