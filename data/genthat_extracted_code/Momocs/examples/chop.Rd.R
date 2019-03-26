library(Momocs)


### Name: chop
### Title: Split to several objects based on a factor
### Aliases: chop

### ** Examples

 olea %>%
      filter(var == "Aglan") %>% # to have a balanced nb of 'view'
      chop(~view) %>%    # split into a list of 2
      lapply(npoly) %>% # separately apply npoly
      combine %>%       # recombine
      PCA %>% plot      # an illustration of the 2 views
      # treated separately



