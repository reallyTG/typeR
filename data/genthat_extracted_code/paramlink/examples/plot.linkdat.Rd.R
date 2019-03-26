library(paramlink)


### Name: plot.linkdat
### Title: Plot pedigrees with genotypes
### Aliases: plot.linkdat plot.singleton

### ** Examples


data(toyped)
x = linkdat(toyped)
plot(x, marker=1, alleles=c('a1','a2'), sep=' | ', deceased=2)

y = singleton(id=1) 
m = marker(y, 1, c('A',0), alleles=c('A','B'))
plot(y, marker=m, id='indiv 1', title='Singleton', available=TRUE)




