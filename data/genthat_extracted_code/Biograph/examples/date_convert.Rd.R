library(Biograph)


### Name: date_convert
### Title: Converts vector of dates from one format to another
### Aliases: date_convert

### ** Examples

    data(GLHS)
    b <- date_convert(d='01/01/2011',format.in='%m/%d/%Y',selectday=1,format.out='day-month-year')  
    dd <- GLHS$marriage
    fo <- 'day-mon-year'
    gb <- GLHS$born
    bb<- date_convert(d=dd,format.in="CMC",selectday=1,format.out=fo,born=gb,format.born="CMC")
    


