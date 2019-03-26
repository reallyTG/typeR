library(rgr)


### Name: gx.sort.df
### Title: Function to Multi-Column Sort a Data Frame
### Aliases: gx.sort.df
### Keywords: misc arith

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)
names(kola.c)

## Create a small test data set for ID (1), COUNTRY (4),
## As (17), Co (21), Cu (23) and Ni (28)
test<-kola.c[1:25, c(1,4,17,21,23,28)]

## Sort test data into ascending order on the value of Ni
gx.sort.df(~Ni, test)
temp <- gx.sort.df(test, ~Ni)
temp

## Sort test data by Country and descending order of As
gx.sort.df(test, ~COUNTRY-As)

## Sort test data by Country and descending order of both
## As and Ni
gx.sort.df(test, ~COUNTRY-As-Ni)

## Clean-up and detach test data
rm(test)
rm(temp)
detach(kola.c)



