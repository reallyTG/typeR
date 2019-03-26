library(ClusteredMutations)


### Name: showers
### Title: Location of clustered mutations in the cancer genome.
### Aliases: showers

### ** Examples

###Example 1:
example1<-c(1,101,201,299,301,306,307,317,318,320,418,518,528,628)
showers(position=example1, min=5, max=100)

###Example 2:
example2<-c(1,101,201,299,301,306,307,317,318,320,402,404,406,628)
showers(position=example2, min=5, max=100)

###Example 3:
#data(PD4107a)

###Locate the clustered mutations;
#showers(data=PD4107a,chr=Chr,position=Position)

###Locate the complex mutations;
#complex.showers<-showers(data=PD4107a,chr=Chr,position=Position,min=2,max=10)
#nrow(complex.showers)
#table(complex.showers$chr)



