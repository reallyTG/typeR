## ---- echo=FALSE, message=FALSE------------------------------------------
library(rmonad)
library(magrittr)
set.seed(210)

## ------------------------------------------------------------------------
# %>>% corresponds to Haskell's >>=
1:5      %>>%
    sqrt %>>%
    sqrt %>>%
    sqrt

## ------------------------------------------------------------------------
1:5      %>%
    sqrt %>%
    sqrt %>%
    sqrt

## ------------------------------------------------------------------------
1:5      %>>%
    sqrt %v>% # store this result
    sqrt %>>%
    sqrt

## ------------------------------------------------------------------------
1:5 %>>% { o <- . * 2 ; { o + . } %>% { . + o } }

## ------------------------------------------------------------------------
-1:3     %>>%
    sqrt %v>%
    sqrt %>>%
    sqrt

## ------------------------------------------------------------------------
"wrench" %>>%
    sqrt %v>%
    sqrt %>>%
    sqrt

## ---- error=TRUE---------------------------------------------------------
"wrench" %>%
    sqrt %>%
    sqrt %>%
    sqrt

## ------------------------------------------------------------------------
1:5 %>>% sqrt %>% esc

## ---- error=TRUE---------------------------------------------------------
"wrench" %>>% sqrt %>>% sqrt %>% esc

## ------------------------------------------------------------------------
1:5      %>>%
    sqrt %v>%
    sqrt %>>%
    sqrt %>% mtabulate

## ------------------------------------------------------------------------
-2:2 %>>% sqrt %>>% colSums %>% missues

## ------------------------------------------------------------------------
result <- 1:5 %v>% sqrt %v>% sqrt %v>% sqrt
get_value(result)[[2]]

## ---- eval=FALSE---------------------------------------------------------
#  cars %>_% write.csv(file="cars.tab") %>>% summary

## ------------------------------------------------------------------------
cars %>_% plot(xlab="index", ylab="value") %>>% summary

## ---- eval=FALSE---------------------------------------------------------
#  cars                                 %>_%
#      plot(xlab="index", ylab="value") %>_%
#      write.csv(file="cars.tab")       %>>%
#      summary

## ------------------------------------------------------------------------
iris                                    %>_%
    { stopifnot(is.data.frame(.))     } %>_%
    { stopifnot(sapply(.,is.numeric)) } %>>%
    colSums %|>% head

## ------------------------------------------------------------------------
1:10 %>>% colSums %|>% sum

## ---- eval=FALSE---------------------------------------------------------
#  # try to load a cached file, on failure rerun the analysis
#  read.table("analyasis_cache.tab") %||% run_analysis(x)

## ------------------------------------------------------------------------
x <- list()
# compare
if(length(x) > 0) { x[[1]] } else { NULL }
# to 
x[[1]] %||% NULL %>% esc

## ---- eval=FALSE---------------------------------------------------------
#  read.table("a.tab") %||% read.table("a.tsv") %>>% dostuff

## ------------------------------------------------------------------------
letters[1:10] %v>% colSums %|>% sum %||% message("Can't process this")

## ---- eval=FALSE---------------------------------------------------------
#  rnorm(30) %>^% qplot(xlab="index", ylab="value") %>>% mean

## ---- eval=FALSE---------------------------------------------------------
#  rnorm(30) %>^% qplot(xlab="index", ylab="value") %>^% summary %>>% mean

## ------------------------------------------------------------------------
x <- 1:10 %>^% dgamma(10, 1) %>^% dgamma(10, 5) %^>% cor
get_value(x)

## ---- fig.cap="1: the original iris table, 2: stores the cached iris data, 3: nrow, 4: qplot, 5: summary."----
# build memory cacher
f <- make_recacher(memory_cache)

# make core dataset
m <- as_monad(iris) %>>%
    dplyr::select(
        sepal_length = Sepal.Length,
        sepal_width = Sepal.Width,
        species = Species
    ) %>%
    # cache value with tag 'iris'
    f('iris') %>>%
    # some downstream stuff
    nrow 
# Now can pick from the tagged node
m <- view(m, 'iris') %>>% {
  qplot(
      x=sepal_length,
      y=sepal_width,
      color=species,
      data=.
  )} %>% f('plot')
# and repeat however many times we like 
m <- view(m, 'iris') %>>% summary %>% f('sum')

plot(m)

## ------------------------------------------------------------------------
runif(10) %>>% sum %__%
rnorm(10) %>>% sum %__%
rexp(10)  %>>% sum

## ---- eval=FALSE---------------------------------------------------------
#  program <-
#  {
#      x = 2
#      y = 5
#      x * y
#  } %__% {
#      letters %>% sqrt
#  } %__% {
#      10 * x
#  }

## ------------------------------------------------------------------------
funnel(
    "yolo",
    stop("stop, drop, and die"),
    runif("simon"),
    k = 2
)

## ---- error=TRUE---------------------------------------------------------
list( "yolo", stop("stop, drop, and die"), runif("simon"), 2)

## ---- eval=FALSE---------------------------------------------------------
#  funnel(read.csv("a.csv"), read.csv("b.csv")) %*>% merge

## ---- eval=FALSE---------------------------------------------------------
#  funnel(
#      a = read.csv("a.csv") %>>% do_analysis_a,
#      b = read.csv("b.csv") %>>% do_analysis_b,
#      k = 5
#  ) %*>% joint_analysis

## ------------------------------------------------------------------------
{

    "This is docstring. The following list is metadata associated with this
    node. Both the docstring and the metadata list will be processed out of
    this function before it is executed. They also will not appear in the code
    stored in the Rmonad object."

    list(sys = sessionInfo(), foo = "This can be anything")

    # This NULL is necessary, otherwise the metadata list above would be
    # treated as the node output
    NULL

} %__% # The %__% operator connects independent pieces of a pipeline.

"a" %>>% {

    "The docstrings are stored in the Rmonad objects. They may be extracted in
    the generation of reports. For example, they could go into a text block
    below the code in a knitr document. The advantage of having documentation
    here, is that it is coupled unambiguously to the generating function. These
    annotations, together with the ability to chain chains of monads, allows
    whole complex workflows to be built, with the results collated into a
    single object. All errors propagate exactly as errors should, only
    affecting downstream computations. The final object can be converted into a
    markdown document and automatically generated function graphs."

    paste(., "b")

}

## ------------------------------------------------------------------------
foo <- function(x, y) {
    "This is a function containing a pipeline. It always fails"    

    "a" %>>% paste(x) %>>% paste(y) %>>% log
}

bar <- function(x) {
    "this is another function, it doesn't fail"

    funnel("b", "c") %*>% foo %>>% paste(x)
}

"d" %>>% bar

## ------------------------------------------------------------------------
"hello world" %>>% {
  list(
    format_error=function(x, err){
      paste0("Failure on input '", x, "': ", err)  
    }
  )
  sqrt(.)
}

## ------------------------------------------------------------------------
d <- mtcars %>>% {
  list(summarize=summary)
  subset(., mpg > 20)
} %>>% nrow

get_summary(d)[[2]]

