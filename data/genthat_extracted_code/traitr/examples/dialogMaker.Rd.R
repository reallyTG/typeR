library(traitr)


### Name: dialogMaker
### Title: Automatically create a dialog for a function
### Aliases: dialogMaker

### ** Examples

f <- function(x..numeric=1, y..string="a") print(list(x,y))
## Not run: dialogMaker(f)
## can have missing arguments
f <- function(x, y..numeric=1) print(list(x,y))
## Not run: dialogMaker(f)
## a choice item. Sizing is funny for tables
f <- function(x..choice=letters) print(x)
## Not run: dialogMaker(f)
## range items
f <- function(x..numeric=0, mu..numeric=0,
              alternative..choice=c("two.sided","less","greater"),
              conf.level..range=c(.80,1.00, .01, .95)) {
              out <- capture.output(t.test(x, alt=alternative, conf.level=conf.level))
              print(out)
}
## Not run: dialogMaker(f, title="CI from t.test with summarized values")



