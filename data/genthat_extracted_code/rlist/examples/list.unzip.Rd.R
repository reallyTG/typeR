library(rlist)


### Name: list.unzip
### Title: Transform a list of elements with similar structure into a list
###   of decoupled fields
### Aliases: list.unzip

### ** Examples

list.unzip(list(p1 = list(a = 1, b = 2), p2 = list(a = 2, b = 3)))
list.unzip(list(p1 = list(a = 1, b = 2), p2 = list(a = 2, b = 3, c = 4)))
list.unzip(list(p1 = list(a = 1, b = 2), p2 = list(a = 2, b = 3, c = 4)), 'union')
list.unzip(list(p1 = list(a = 1, b = 2), p2 = list(a = 2, b = 3, c = 4)), 'union', a = 'identity')
list.unzip(list(p1 = list(a = 1, b = 2), p2 = list(a = 2, b = 3, c = 4)), 'intersect', a = NULL)

x <-
 list(april = list(n_days = 30,
   holidays = list(list('2015-04-01', 'april fools'),
 list('2015-04-05', 'easter')),
   month_info = c(number = '4', season = 'spring')),
     july = list(n_days = 31,
 holidays = list(list('2014-07-04', 'july 4th')),
   month_info = c(number = '7', season = 'summer')))
list.unzip(x, holidays = c('list.ungroup', 'unname', 'list.stack',
  function(df) setNames(df, c("date", "name"))))



