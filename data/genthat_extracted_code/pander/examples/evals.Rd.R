library(pander)


### Name: evals
### Title: Evaluate and Process R Code
### Aliases: evals

### ** Examples

## Not run: 
##D # parsing several lines of R code
##D txt <- readLines(textConnection('x <- rnorm(100)
##D   runif(10)
##D   warning('Lorem ipsum foo-bar-foo!')
##D   plot(1:10)
##D   qplot(rating, data = movies, geom = 'histogram')
##D   y <- round(runif(100))
##D   cor.test(x, y)
##D   crl <- cor.test(runif(10), runif(10))
##D   table(mtcars$am, mtcars$cyl)
##D   ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))'))
##D evals(txt)
##D 
##D ## parsing a list of commands
##D txt <- list('df <- mtcars',
##D  c('plot(mtcars$hp, pch = 19)','text(mtcars$hp, label = rownames(mtcars), pos = 4)'),
##D  'ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))')
##D evals(txt)
##D 
##D ## the same commands in one string but also evaluating the `plot` with `text`
##D ## (note the leading '+' on the beginning of `text...` line)
##D txt <- 'df <- mtcars
##D  plot(mtcars$hp, pch = 19)
##D  +text(mtcars$hp, label = rownames(mtcars), pos = 4)
##D  ggplot(mtcars) + geom_point(aes(x = hp, y = mpg))'
##D evals(txt)
##D ## but it would fail without parsing
##D evals(txt, parse = FALSE)
##D 
##D ## handling messages
##D evals('message(20)')
##D evals('message(20);message(20)', parse = FALSE)
##D 
##D ## adding a caption to a plot
##D evals('set.caption("FOO"); plot(1:10)')
##D ## `plot` is started with a `+` to eval the codes in the same chunk
##D ## (no extra chunk with NULL result)
##D evals('set.caption("FOO"); +plot(1:10)')
##D 
##D ## handling warnings
##D evals('chisq.test(mtcars$gear, mtcars$hp)')
##D evals(list(c('chisq.test(mtcars$gear, mtcars$am)', 'pi',
##D   'chisq.test(mtcars$gear, mtcars$hp)')), parse = FALSE)
##D evals(c('chisq.test(mtcars$gear, mtcars$am)',
##D   'pi',
##D   'chisq.test(mtcars$gear, mtcars$hp)'))
##D 
##D ## handling errors
##D evals('runiff(20)')
##D evals('Old MacDonald had a farm\...')
##D evals('## Some comment')
##D evals(c('runiff(20)', 'Old MacDonald had a farm?'))
##D evals(list(c('runiff(20)', 'Old MacDonald had a farm?')), parse = FALSE)
##D evals(c('mean(1:10)', 'no.R.function()'))
##D evals(list(c('mean(1:10)', 'no.R.function()')), parse = FALSE)
##D evals(c('no.R.object', 'no.R.function()', 'very.mixed.up(stuff)'))
##D evals(list(c('no.R.object', 'no.R.function()', 'very.mixed.up(stuff)')), parse = FALSE)
##D evals(c('no.R.object', 'Old MacDonald had a farm\...', 'pi'))
##D evals('no.R.object;Old MacDonald had a farm\...;pi', parse = FALSE)
##D evals(list(c('no.R.object', 'Old MacDonald had a farm\...', 'pi')), parse = FALSE)
##D 
##D ## graph options
##D evals('plot(1:10)')
##D evals('plot(1:10);plot(2:20)')
##D evals('plot(1:10)', graph.output = 'jpg')
##D evals('plot(1:10)', height = 800)
##D evals('plot(1:10)', height = 800, hi.res = TRUE)
##D evals('plot(1:10)', graph.output = 'pdf', hi.res = TRUE)
##D evals('plot(1:10)', res = 30)
##D evals('plot(1:10)', graph.name = 'myplot')
##D evals(list('plot(1:10)', 'plot(2:20)'), graph.name = 'myplots-%d')
##D evals('plot(1:10)', graph.env = TRUE)
##D evals('x <- runif(100);plot(x)', graph.env = TRUE)
##D evals(c('plot(1:10)', 'plot(2:20)'), graph.env = TRUE)
##D evals(c('x <- runif(100)', 'plot(x)','y <- runif(100)', 'plot(y)'), graph.env = TRUE)
##D evals(list(
##D     c('x <- runif(100)', 'plot(x)'),
##D     c('y <- runif(100)', 'plot(y)')),
##D   graph.env = TRUE, parse = FALSE)
##D evals('plot(1:10)', graph.recordplot = TRUE)
##D ## unprinted lattice plot
##D evals('histogram(mtcars$hp)', graph.recordplot = TRUE)
##D 
##D ## caching
##D system.time(evals('plot(mtcars)'))
##D system.time(evals('plot(mtcars)'))                # running again to see the speed-up :)
##D system.time(evals('plot(mtcars)', cache = FALSE)) # cache disabled
##D 
##D ## caching mechanism does check what's inside a variable:
##D x <- mtcars
##D evals('plot(x)')
##D x <- cbind(mtcars, mtcars)
##D evals('plot(x)')
##D x <- mtcars
##D system.time(evals('plot(x)'))
##D 
##D ## stress your CPU - only once!
##D evals('x <- sapply(rep(mtcars$hp, 1e3), mean)')   # run it again!
##D 
##D ## play with cache
##D require(lattice)
##D evals('histogram(rep(mtcars$hp, 1e5))')
##D ## nor run the below call
##D ## that would return the cached version of the above call :)
##D f <- histogram
##D g <- rep
##D A <- mtcars$hp
##D B <- 1e5
##D evals('f(g(A, B))')#'
##D 
##D ## or switch off cache globally:
##D evalsOptions('cache', FALSE)
##D ## and switch on later
##D evalsOptions('cache', TRUE)
##D 
##D ## evaluate assignments inside call to evals
##D ## changes to environments are cached properly and retreived
##D evalsOptions('cache.time', 0)
##D x <- 2
##D evals('x <- x^2')[[1]]$result
##D evals('x <- x^2; x + 1')[[2]]$result
##D evalsOptions('cache.time', 0.1)
##D 
##D ## returning only a few classes
##D txt <- readLines(textConnection('rnorm(100)
##D   list(x = 10:1, y = 'Godzilla!')
##D   c(1,2,3)
##D    matrix(0,3,5)'))
##D evals(txt, classes = 'numeric')
##D evals(txt, classes = c('numeric', 'list'))
##D 
##D ## hooks
##D txt <- 'runif(1:4); matrix(runif(25), 5, 5); 1:5'
##D hooks <- list('numeric' = round, 'matrix' = pander_return)
##D evals(txt, hooks = hooks)
##D ## using pander's default hook
##D evals(txt, hooks = list('default' = pander_return))
##D evals('22/7', hooks = list('numeric' = round))
##D evals('matrix(runif(25), 5, 5)', hooks = list('matrix' = round))
##D 
##D ## setting default hook
##D evals(c('runif(10)', 'matrix(runif(9), 3, 3)'),
##D   hooks = list('default'=round))
##D ## round all values except for matrices
##D evals(c('runif(10)', 'matrix(runif(9), 3, 3)'),
##D   hooks = list(matrix = 'print', 'default' = round))
##D 
##D # advanced hooks
##D hooks <- list('numeric' = list(round, 2), 'matrix' = list(round, 1))
##D evals(txt, hooks = hooks)
##D 
##D # return only returned values
##D evals(txt, output = 'result')
##D 
##D # return only messages (for checking syntax errors etc.)
##D evals(txt, output = 'msg')
##D 
##D # check the length of returned values and do not return looong R objects
##D evals('runif(10)', length = 5)
##D 
##D # note the following will not be filtered!
##D evals('matrix(1,1,1)', length = 1)
##D 
##D # if you do not want to let such things be eval-ed in the middle of a string
##D # use it with other filters :)
##D evals('matrix(1,1,1)', length = 1, classes = 'numeric')
##D 
##D # hooks & filtering
##D evals('matrix(5,5,5)',
##D   hooks = list('matrix' = pander_return),
##D   output = 'result')
##D 
##D # eval-ing chunks in given environment
##D myenv <- new.env()
##D evals('x <- c(0,10)', env = myenv)
##D evals('mean(x)', env = myenv)
##D rm(myenv)
##D # note: if you had not specified 'myenv', the second 'evals' would have failed
##D evals('x <- c(0,10)')
##D evals('mean(x)')
##D 
##D # log
##D x <- evals('1:10', log = 'foo')
##D # trace log
##D evalsOptions('cache.time', 0)
##D x <- evals('1:10', log = 'foo')
##D x <- evals('1:10', log = 'foo')
##D # log to file
##D t <- tempfile()
##D flog.appender(appender.file(t), name = 'evals')
##D x <- evals('1:10', log = 'evals')
##D readLines(t)
##D # permanent log for all events
##D evalsOptions('log', 'evals')
##D flog.threshold(TRACE, 'evals')
##D evals('foo')
## End(Not run)



