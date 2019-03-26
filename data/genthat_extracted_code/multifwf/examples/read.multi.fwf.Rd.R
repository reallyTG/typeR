library(multifwf)


### Name: read.multi.fwf
### Title: Read Fixed Width Format Files containing lines of different Type
### Aliases: read.multi.fwf

### ** Examples

ff <- tempfile()
cat(file = ff, '123456', '287654', '198765', sep = '\n')
specs <- list()
specs[['sp1']] = data.frame(widths = c(1, 2, 3), 
                            col.names = c('Col1', 'Col2', 'Col3'))
specs[['sp2']] = data.frame(widths = c(3, 2, 1), 
                            col.names = c('C1', 'C2', 'C3'))

myselector <- function(line, specs) {
    s <- substr(line, 1, 1)
    spec_name = ''
    if (s == '1')
        spec_name = 'sp1'
    else if (s == '2')
        spec_name = 'sp2'

    spec_name
}

read.multi.fwf(ff, multi.specs = specs, select = myselector)    
#> sp1: 1 23 456 \ 1 98 765, sp2: 287 65 4

unlink(ff)



