library(TeachingDemos)


### Name: TkListView
### Title: Interactivly view structures of list and list like objects.
### Aliases: TkListView
### Keywords: manip attribute list

### ** Examples

if(interactive()) {
  tmp <- list( a=letters, b=list(1:10, 10:1), c=list( x=rnorm(100),
        z=data.frame(x=rnorm(10),y=rnorm(10))))
  TkListView(tmp)

  if(require(maptools)){
    data(state.vbm)
    TkListView(list(state.vbm))
  # change the eval box to: plot(x, type='l') and eval the main branches
  }

  fit <- lm(Petal.Width ~ ., data=iris)
  TkListView(fit)


  if(require(stats4)){
   # this example is copied almost verbatim from ?mle
         x <- 0:10
     y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
     ll <- function(ymax=15, xhalf=6)
         -sum(stats::dpois(y, lambda=ymax/(1+x/xhalf), log=TRUE))
     (fit <- mle(ll))
     TkListView(list(fit))
  }
}



