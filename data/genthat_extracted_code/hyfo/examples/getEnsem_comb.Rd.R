library(hyfo)


### Name: getEnsem_comb
### Title: Combine ensembles together
### Aliases: getEnsem_comb

### ** Examples


data(testdl)

a <- testdl[[1]]

# Choose example from "1994-2-4" to "1996-1-4"


b1<- getHisEnsem(a, example = c('1995-2-4', '1996-1-4'), plot = 'cum', output = 'ggplot',
                 name = 1)
                  
b2 <- getHisEnsem(a, example = c('1995-4-4', '1996-3-4'), plot = 'cum', output = 'ggplot',
                 name = 2)

getEnsem_comb(b1, b2)
getEnsem_comb(list = list(b1, b2), nrow = 2)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/





