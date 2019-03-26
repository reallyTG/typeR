## ---- message=FALSE------------------------------------------------------
library(mclust)
library(mixpack)
library(ggplot2)
library(dplyr)

## ---- fig.width=5, fig.height=4, fig.align='center'----------------------
data(Baudry_etal_2010_JCGS_examples)
qplot(data=ex4.1, X1, X2)

## ------------------------------------------------------------------------
m <- Mclust(ex4.1)
summary(m)

## ------------------------------------------------------------------------
dens.mixt = dmixnorm_solution(ex4.1, solution = m)
(df <- lapply(1:6, function(i) 
  (m$parameters$pro[i] * dmixnorm_solution(ex4.1, solution = m, part=i)) %>%
    data.frame %>% {./dens.mixt} %>%
    setNames(sprintf('p%02d', i)) ) %>% bind_cols) %>% tbl_df

## ------------------------------------------------------------------------
m$z %>% tbl_df

## ------------------------------------------------------------------------
xlimits = seq(-3, 11, 0.05)
ylimits = seq(-3, 8, 0.05)
cm0 = expand.grid(X1 = xlimits, X2 = ylimits) %>% tbl_df %>%
  mutate(z = dmixnorm_solution(., solution=m))

## ---- fig.width=5, fig.height=4, fig.align='center'----------------------
ggplot() + 
  geom_point(data=ex4.1, aes(x=X1, y=X2),alpha=0.2) + 
  stat_contour(data = cm0, aes(x=X1, y=X2, z=z))

## ---- fig.width=5, fig.height=4, fig.align='center'----------------------
partition = list(1,2,3,4,5,6)
CN6 = lapply(partition, function(part){
  expand.grid(X1 = xlimits, X2 = ylimits) %>%
    tbl_df %>%
    mutate(z = dmixnorm_solution(., m, part = part),
           id = sprintf('{%s}',paste(part, collapse=',')))
}) %>% bind_rows

ggplot() + 
  geom_point(data=ex4.1, aes(x=X1, y=X2),alpha=0.2) + 
  stat_contour(data = CN6, aes(x=X1, y=X2, z=z, col=id))

## ---- fig.width=5, fig.height=4, fig.align='center'----------------------
partition = list(c(1,6,2),c(3,4),5)
CN6 = lapply(partition, function(part){
  expand.grid(X1 = xlimits, X2 = ylimits) %>%
    mutate(z = dmixnorm_solution(., m, part = part),
           id = sprintf('{%s}',paste(part, collapse=',')))
}) %>% bind_rows

ggplot() + 
  geom_point(data=ex4.1, aes(x=X1, y=X2),alpha=0.2) + 
  stat_contour(data = CN6, aes(x=X1, y=X2, z=z, col=id))

