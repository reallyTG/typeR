library(NormExpression)


### Name: change_colours
### Title: change_colours
### Aliases: change_colours
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (p, palette, type)
{
    n <- nlevels(p$data[[deparse(p$mapping$group)]])
    tryCatch(as.character(palette), error = function(e) stop("be vector",call. = FALSE))
    if (n > length(palette))
        stop("Not enough colours in palette.")
    if (missing(type))
        type <- grep("colour|fill", names(p$layers[[1]]$mapping),
            value = TRUE)[1]
    pal <- function(n) palette[seq_len(n)]
    p + discrete_scale(type, "foo", pal)
  }



