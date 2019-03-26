library(hyfo)


### Name: getPreciBar_comb
### Title: Combine bars together
### Aliases: getPreciBar_comb

### ** Examples


data(tgridData)# the result of \code{loadNcdf}
#output type of getPreciBar() has to be 'ggplot'.
b1 <- getPreciBar(tgridData, method = 2, output = 'ggplot', name = 'b1')
b2 <- getPreciBar(tgridData, method = 3, output = 'ggplot', name = 'b2')

getPreciBar_comb(b1, b2)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




