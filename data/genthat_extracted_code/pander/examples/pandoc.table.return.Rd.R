library(pander)


### Name: pandoc.table.return
### Title: Create a table
### Aliases: pandoc.table.return pandoc.table

### ** Examples

pandoc.table(mtcars)

# caption
pandoc.table(mtcars, 'Motor Trend Car Road Tests')

# other input/output formats
pandoc.table(mtcars[, 1:3], decimal.mark = ',')
pandoc.table(mtcars[, 1:3], decimal.mark = ',', justify = 'right')
pandoc.table(matrix(sample(1:1000, 25), 5, 5))
pandoc.table(matrix(runif(25), 5, 5))
pandoc.table(matrix(runif(25), 5, 5), digits = 5)
pandoc.table(matrix(runif(25),5,5), round = 1)
pandoc.table(table(mtcars$am))
pandoc.table(table(mtcars$am, mtcars$gear))
pandoc.table(table(state.division, state.region))
pandoc.table(table(state.division, state.region), justify = 'centre')

m <- data.frame(a = c(1, -500, 10320, 23, 77),
  b = runif(5),
  c = c('a', 'bb', 'ccc', 'dddd', 'eeeee'))
pandoc.table(m)
pandoc.table(m, justify = c('right', 'left', 'centre'))
pandoc.table(m, justify = 'rlc') # Same as upper statement

## splitting up too wide tables
pandoc.table(mtcars)
pandoc.table(mtcars, caption = 'Only once after the first part!')

## tables with line breaks in cells
## NOTE: line breaks are removed from table content in case keep.line.breaks is set to FALSE
## and added automatically based on "split.cells" parameter!
t <- data.frame(a = c('hundreds\nof\nmouses', '3 cats'), b=c('FOO is nice', 'BAR\nBAR2'))
pandoc.table(t)
pandoc.table(t, split.cells = 5)

## exporting tables in other Pandoc styles
pandoc.table(m)
pandoc.table(m, style = "grid")
pandoc.table(m, style = "simple")
pandoc.table(t, style = "grid")
pandoc.table(t, style = "grid", split.cells = 5)
tryCatch(pandoc.table(t, style = "simple", split.cells = 5),
  error = function(e) 'Yeah, no newline support in simple tables')

## highlight cells
t <- mtcars[1:3, 1:5]
pandoc.table(t$mpg, emphasize.italics.cells = 1)
pandoc.table(t$mpg, emphasize.strong.cells = 1)
pandoc.table(t$mpg, emphasize.italics.cells = 1, emphasize.strong.cells = 1)
pandoc.table(t$mpg, emphasize.italics.cells = 1:2)
pandoc.table(t$mpg, emphasize.strong.cells = 1:2)
pandoc.table(t, emphasize.italics.cells = which(t > 20, arr.ind = TRUE))
pandoc.table(t, emphasize.italics.cells = which(t == 6, arr.ind = TRUE))
pandoc.table(t, emphasize.verbatim.cells = which(t == 6, arr.ind = TRUE))
pandoc.table(t, emphasize.verbatim.cells = which(t == 6, arr.ind = TRUE),
 emphasize.italics.rows = 1)
## with helpers
emphasize.cols(1)
emphasize.rows(1)
pandoc.table(t)

emphasize.strong.cells(which(t > 20, arr.ind = TRUE))
pandoc.table(t)

### plain.ascii
pandoc.table(mtcars[1:3, 1:3], plain.ascii = TRUE)

### keep.line.breaks
x <- data.frame(a="Pandoc\nPackage")
pandoc.table(x)
pandoc.table(x, keep.line.breaks = TRUE)

## split.cells
x <- data.frame(a = "foo bar", b = "foo bar")
pandoc.table(x, split.cells = 4)
pandoc.table(x, split.cells = 7)
pandoc.table(x, split.cells = c(4, 7))
pandoc.table(x, split.cells = c("20%", "80%"), split.tables = 30)

y <- c("aa aa aa", "aaa aaa", "a a a a a", "aaaaa", "bbbb bbbb bbbb", "bb bbb bbbb")
y <- matrix(y, ncol = 3, nrow = 2)
rownames(y) <- c("rowname one", "rowname two")
colnames(y) <- c("colname one", "colname two", "colname three")
pandoc.table(y, split.cells = 2)
pandoc.table(y, split.cells = 6)
pandoc.table(y, split.cells = c(2, 6, 10))
pandoc.table(y, split.cells = c(2, Inf, Inf))

## first value used for rownames
pander(y, split.cells = c(5, 2, Inf, Inf))
pandoc.table(y, split.cells = c(5, 2, Inf, 5, 3, 10))

## when not enough reverting to default values
pandoc.table(y, split.cells = c(5, 2))

## split.cells with hyphenation
x <- data.frame(a = "Can be also supplied as a vector, for each cell separately",
       b = "Can be also supplied as a vector, for each cell separately")
pandoc.table(x, split.cells = 10, use.hyphening = TRUE)



