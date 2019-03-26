library(caroline)


### Name: m
### Title: Regexp Match Operator
### Aliases: m
### Keywords: manip

### ** Examples


## single vector output examples
m(pattern="asdf.([A-Z]{4}).", 
  vect=c('asdf.AS.fds','asdf.ABCD.asdf', '12.ASDF.asdf','asdf.REWQ.123'))


Rurls <- c('http://www.r-project.org',    'http://cran.r-project.org',
           'http://journal.r-project.org','http://developer.r-project.org')
m(pattern="http://([a-z]+).r-project.org", vect=Rurls)


# dataframe output examples

data(mtcars)
m(pattern="^([A-Za-z]+) ?(.*)$", 
  vect=rownames(mtcars), names=c('make','model'), types=rep('character',2))





