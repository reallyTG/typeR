library(openintro)


### Name: treeDiag
### Title: Construct tree diagrams
### Aliases: treeDiag
### Keywords: Tree diagram Conditional probability Bayes Theorem

### ** Examples

# Examples
# generic with random probabilities

treeDiag(c('Flight on time?','Luggage on time?'),
   c(.8,.2), list(c(.97,.03), c(.15,.85)))

treeDiag(c('Breakfast?','Go to class'), c(.4,.6),
   list(c(.4,.36,.34),c(.6,.3,.1)), c('Yes','No'),
   c('Statistics','English','Sociology'), showWork=TRUE)

treeDiag(c('Breakfast?','Go to class'), c(.4,.11,.49),
   list(c(.4,.36,.24),c(.6,.3,.1),c(.1,.4,.5)),
   c('one','two','three'), c('Statistics','English','Sociology'))

treeDiag(c('Dow Jones rise?', 'NASDAQ rise?'),
   c(0.53, 0.47), list(c(0.75, 0.25), c(0.72, 0.28)),
   solSub=list(c("(a)", "(b)"), c("(c)", "(d)")), solwd=0.08)



