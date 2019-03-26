library(vcd)


### Name: PreSex
### Title: Pre-marital Sex and Divorce
### Aliases: PreSex
### Keywords: datasets

### ** Examples

data("PreSex")

## Mosaic display for Gender and Premarital Sexual Experience
## (Gender Pre)
mosaic(margin.table(PreSex, c(3,4)), 
                main = "Gender and Premarital Sex")

## (Gender Pre)(Extra)
mosaic(margin.table(PreSex, c(2,3,4)), 
       expected = ~Gender * PremaritalSex + ExtramaritalSex ,
	   main = "PreMaritalSex*Gender +Sex")

## (Gender Pre Extra)(Marital)
mosaic(PreSex,
       expected = ~Gender*PremaritalSex*ExtramaritalSex + MaritalStatus,
       main = "PreMarital*ExtraMarital + MaritalStatus")

## (GPE)(PEM)
mosaic(PreSex, 
       expected = ~ Gender * PremaritalSex * ExtramaritalSex
                    + MaritalStatus * PremaritalSex * ExtramaritalSex,
       main = "G*P*E + P*E*M")



