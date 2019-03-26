library(latexpdf)


### Name: reserve.data.frame
### Title: Escape LaTeX Reserved Characters in Data Frames
### Aliases: reserve.data.frame

### ** Examples

foo <- c('#','$%^','&_{','}~\\')
bar <- data.frame(
 stringsAsFactors = FALSE,
 a = as.numeric(factor(foo)),
 b = foo,
 c = factor(foo)
)

reserve(bar)
# as.pdf(bar, wider = 10)
# as.pdf(bar, target = '#') # fails




