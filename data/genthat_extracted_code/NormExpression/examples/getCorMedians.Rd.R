library(NormExpression)


### Name: getCorMedians
### Title: getCorMedians
### Aliases: getCorMedians
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data)
{
    if (!is.data.frame(data))
        data <- data.frame(data)
    if (is.factor(data$Value))
        data$Value <- as.numeric(as.character(data$Value))
    sorted_result <- sort(tapply(data$Value, data$Methods, median),
        decreasing = FALSE)
    return(sorted_result)
  }



