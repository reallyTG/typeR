library(oshka)


### Name: expand
### Title: Recursively Expand Symbols in Quoted Language
### Aliases: expand

### ** Examples

xzw <- uvt <- NULL  # make sure not lang objects
aaa <- quote(xzw > 3)
bbb <- quote(xzw < 10)
ccc <- quote(aaa & bbb)
expand(ccc)

## You can place list like objects in the search path
l <- list(bbb=quote(uvt < 9999))
expand(ccc, l)

## But notice what happens if we use `quote(ccc)` instead of
## just `ccc`.  This is because in this case `expand` must
## look for the `ccc` symbol in the search path, and once
## it finds it it looks for `aaa` and `bbb` starting from the
## environment `ccc` is bound to, so the `bbb` defined
## inside `l` is skipped.
expand(quote(ccc), l)

## Implementing an NSE fun (see vignettes for detailed
## examples)
subset2 <- function(x, subset) {
  subset <- expand(substitute(subset), x, parent.frame())
  eval(bquote(base::subset(.(x), .(subset))), parent.frame())
}
subset2(iris, Sepal.Width > 4.3)
iris.sub <- quote(Sepal.Width > 4.3)
subset2(iris, iris.sub)

## You can shield all instances of a symbol from expansion.
## Note we append existing name shield list.

expand(ccc, name.shield=c(getOption('oshka.name.shield'), 'bbb'))

## You can also shield by attaching classes to language
## objects or portions thereof
expand(I(ccc))  # add the `AsIs` class to `ccc` with `I`
expand(ccc)

## If you wish to shield a symbol with this method you
## cannot do so directly.  Note the `quote((bbb))` as 
## otherwise we would attach attributes to a symbol:
ccd <- bquote(aaa & .(I(quote((bbb)))))
expand(ccd)

## Equivalently
cce <- ccc
cce[[3]] <- I(quote((bbb)))
expand(cce)

## Formulas not expanded by default, but can be forced
## to expand by setting `class.shield` to FALSE
expand(aaa ~ bbb)
expand(aaa ~ bbb, class.shield=FALSE)



