library(rsample)


### Name: tidy.rsplit
### Title: Tidy Resampling Object
### Aliases: tidy.rsplit tidy.rset tidy.vfold_cv tidy.nested_cv

### ** Examples

library(ggplot2)
theme_set(theme_bw())

set.seed(4121)
cv <- tidy(vfold_cv(mtcars, v = 5))
ggplot(cv, aes(x = Fold, y = Row, fill = Data)) + 
  geom_tile() + scale_fill_brewer()
  
set.seed(4121)
rcv <- tidy(vfold_cv(mtcars, v = 5, repeats = 2))
ggplot(rcv, aes(x = Fold, y = Row, fill = Data)) + 
  geom_tile() + facet_wrap(~Repeat) + scale_fill_brewer()
  
set.seed(4121)
mccv <- tidy(mc_cv(mtcars, times = 5))
ggplot(mccv, aes(x = Resample, y = Row, fill = Data)) + 
  geom_tile() + scale_fill_brewer() 
  
set.seed(4121)
bt <- tidy(bootstraps(mtcars, time = 5))
ggplot(bt, aes(x = Resample, y = Row, fill = Data)) + 
  geom_tile() + scale_fill_brewer()
  
dat <- data.frame(day = 1:30)
# Resample by week instead of day
ts_cv <- rolling_origin(dat, initial = 7, assess = 7, 
                        skip = 6, cumulative = FALSE)
ts_cv <- tidy(ts_cv)
ggplot(ts_cv, aes(x = Resample, y = factor(Row), fill = Data)) +
  geom_tile() + scale_fill_brewer()



