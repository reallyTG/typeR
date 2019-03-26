library(easyanova)


### Name: ec
### Title: Easy contrast
### Aliases: ec

### ** Examples

# Kaps and Lamberson(2009, pg 254)

data(data1)

r<-ea1(data1, design=1)
r[2]

# first contrast
mg1=312;mg2=c(278,280); sdg1=7.7028;sdg2=c(7.7028,7.7028); df=12
ec(mg1,mg2,sdg1,sdg2,df)

# second contrast
mg1=280;mg2=278; sdg1=7.7028;sdg2=7.7028; df=12
ec(mg1,mg2,sdg1,sdg2,df)




