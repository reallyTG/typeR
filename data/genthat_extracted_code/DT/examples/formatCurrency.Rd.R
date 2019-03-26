library(DT)


### Name: formatCurrency
### Title: Format table columns
### Aliases: formatCurrency formatString formatPercentage formatRound
###   formatSignif formatDate formatStyle

### ** Examples

library(DT)
m = cbind(matrix(rnorm(120, 1e5, 1e6), 40), runif(40), rnorm(40, 100))
colnames(m) = head(LETTERS, ncol(m))
m

# format the columns A and C as currency, and D as percentages
datatable(m) %>% formatCurrency(c('A', 'C')) %>% formatPercentage('D', 2)

# the first two columns are Euro currency, and round column E to 3 decimal places
datatable(m) %>% formatCurrency(1:2, '\U20AC') %>% formatRound('E', 3)

# render vapor pressure with only two significant figures.
datatable(pressure) %>% formatSignif('pressure',2)

# apply CSS styles to columns
datatable(iris) %>%
  formatStyle('Sepal.Length', fontWeight = styleInterval(5, c('bold', 'weight'))) %>%
  formatStyle('Sepal.Width',
    color = styleInterval(3.4, c('red', 'white')),
    backgroundColor = styleInterval(3.4, c('yellow', 'gray'))
  )



