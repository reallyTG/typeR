## ---- echo = F, message = F, results = 'hide'----------------------------
library(yarrr)

## ---- fig.width = 6, fig.height = 6, fig.align='center'------------------
pirateplot(formula = weight ~ Time,
           data = ChickWeight,
           main = "Chicken weights by Time (week)")

## ---- fig.width = 6, fig.height = 6, fig.align = 'center'----------------
piratepal("all")

## ---- fig.width = 6, fig.height = 6, fig.align = 'center'----------------

my.cols <- piratepal(palette = "google",  
                     trans = .5)

set.seed(100) # For reproducibility
x <- rnorm(100)
y <- x + rnorm(100)

plot(x = x, y = y, col =  my.cols,
     pch = 16,
     cex = runif(100, min = 0, max = 2),
     main = "piratepal('google', trans = .5)")

