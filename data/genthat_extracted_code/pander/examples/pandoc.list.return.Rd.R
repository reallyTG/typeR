library(pander)


### Name: pandoc.list.return
### Title: Create a list
### Aliases: pandoc.list.return pandoc.list

### ** Examples

## basic lists
pandoc.list(letters[1:5])
pandoc.list(letters[1:5])
pandoc.list(letters[1:5], 'ordered')
pandoc.list(letters[1:5], 'roman')
pandoc.list(letters[1:5], loose = TRUE)

## nested lists
l <- list("First list element",
  rep.int('sub element', 5),
  "Second element",
  list('F', 'B', 'I', c('phone', 'pad', 'talics')))
pandoc.list(l)
pandoc.list(l, loose = TRUE)
pandoc.list(l, 'roman')

## complex nested lists
pandoc.list(list('one', as.list(2)))
pandoc.list(list('one', list('two')))
pandoc.list(list('one', list(2:3)))



