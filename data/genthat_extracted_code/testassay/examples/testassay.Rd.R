library(testassay)


### Name: testassay
### Title: Hypothesis testing procedure for assay validation for precision
### Aliases: testassay

### ** Examples

# reproduce Table 3 of Fay, Sachs and Miura
I<- gia$parasite=="3D7" & gia$meanAAgia<80
treD7.test<-testassay(x=gia, m=sample, n=assay, q=.9,
  data=subset(gia, parasite=="3D7" & meanAAgia<80))
treD7.test
# get estimated effective standard deviation intervals (68.27 percent CIs)
# for observed values 21.4 and 65.9
# using results from testassay
predict(treD7.test,c(21.4,65.9))




