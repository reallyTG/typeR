library(lemon)


### Name: .dot
### Title: Create paths that are safe from changing working directory.
### Aliases: .dot .dot2

### ** Examples


.data <- .dot('data')
.data('input.txt')
.data(c('a.txt','b.txt'))

.dot2(c('rawdata','results'))
.rawdata('rawfile.csv')
.results('myresults.txt')



