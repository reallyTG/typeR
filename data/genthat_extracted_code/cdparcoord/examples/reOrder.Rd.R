library(cdparcoord)


### Name: reOrder
### Title: Re-order levels of a factor, according to some desired ordinal
###   form.
### Aliases: reOrder

### ** Examples

   sl <- c('primary','college','hs','middle','hs')
   z <- data.frame(
          schlvl = factor(x=sl,
             levels=c('college','hs','middle','primary'))
          )
   z
   z <- reOrder(z,'schlvl',c('primary','middle','hs','college'))
   str(z)  # shows the desired label order in the 'categoryorder' attribute



