## ---- echo=FALSE---------------------------------------------------------
library(ggplot2)

## ---- fig.width=6, fig.height=6------------------------------------------
ggplot(mtcars) +
  geom_point(aes(x=hp, y=wt, colour=factor(cyl)))

