library(wildcard)


### Name: expandrows
### Title: Function 'expand'
### Aliases: expandrows

### ** Examples

df <- data.frame(
  ID = c('24601', 'Javert', 'Fantine'),
  fate = c('fulfillment', 'confusion', 'misfortune'))
expandrows(df, n = 2, type = 'each')
expandrows(df, n = 2, type = 'times')



