library(climatol)


### Name: pcp_results
### Title: Results of a monthly precipitation homogenization
### Aliases: pcp_results dah ini nd ndec ne nei nm std x
### Keywords: datasets

### ** Examples

data(pcp_results)
#station information after the homogenization:
print(est.c)
#raw monthly precipitations of the third station:
print(t(dat[,,3]))
#homogenized monthly precipitations of the third station:
print(t(dah[,,3]))
#range of the dates of the data:
range(x)
#other parameters of the homogenization:
cat('First date:',ini,'\nNumber of data per station:',nd,
'\nNumber of decimals:',ndec,
'\nNumber of series before the homogenization:',nei,
'\nNumber of series after the homogenization:',ne,
'\nNumber of "months" (number of data per year and station):',nm,
'\nType of data normalization:',std,'(normal ratio)\n')
#clean memory space:
rm(est.c,dat,dah,ini,nd,ndec,ne,nei,nm,std,x)



