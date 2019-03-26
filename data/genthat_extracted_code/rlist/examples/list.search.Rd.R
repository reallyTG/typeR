library(rlist)


### Name: list.search
### Title: Search a list recusively by an expression
### Aliases: list.search

### ** Examples

# Exact search

x <- list(p1 = list(type='A',score=c(c1=9)),
       p2 = list(type=c('A','B'),score=c(c1=8,c2=9)),
       p3 = list(type=c('B','C'),score=c(c1=9,c2=7)),
       p4 = list(type=c('B','C'),score=c(c1=8,c2=NA)))

## Search exact values
list.search(x, identical(., 'A'))
list.search(x, identical(., c('A','B')))
list.search(x, identical(., c(9,7)))
list.search(x, identical(., c(c1=9,c2=7)))

## Search all equal values
list.search(x, all(. == 9))
list.search(x, all(. == c(8,9)))
list.search(x, all(. == c(8,9), na.rm = TRUE))

## Search any equal values
list.search(x, any(. == 9))
list.search(x, any(. == c(8,9)))

# Fuzzy search

data <- list(
  p1 = list(name='Ken',age=24),
  p2 = list(name='Kent',age=26),
  p3 = list(name='Sam',age=24),
  p4 = list(name='Keynes',age=30),
  p5 = list(name='Kwen',age=31)
)

list.search(data, grepl('^K\\w+n$', .), 'character')

## Not run: 
##D library(stringdist)
##D list.search(data, stringdist(., 'Ken') <= 1, 'character')
##D list.search(data, stringdist(., 'Man') <= 2, 'character')
##D list.search(data, stringdist(., 'Man') > 2, 'character')
## End(Not run)

data <- list(
  p1 = list(name=c('Ken', 'Ren'),age=24),
  p2 = list(name=c('Kent', 'Potter'),age=26),
  p3 = list(name=c('Sam', 'Lee'),age=24),
  p4 = list(name=c('Keynes', 'Bond'),age=30),
  p5 = list(name=c('Kwen', 'Hu'),age=31))

list.search(data, .[grepl('e', .)], 'character')

## Not run: 
##D list.search(data, all(stringdist(., 'Ken') <= 1), 'character')
##D list.search(data, any(stringdist(., 'Ken') > 1), 'character')
## End(Not run)



