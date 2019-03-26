library(Momocs)


### Name: pile
### Title: Graphical pile of shapes
### Aliases: pile pile.default pile.list pile.array pile.Out pile.Opn
###   pile.Ldk

### ** Examples

# all Coo are supported with sensible defaults
pile(bot)    # outlines
pile(olea, ~var, pal=pal_qual_Dark2, paper_fun=paper_grid)   # curves
pile(wings)  # landmarks

# you can continue the pipe with compatible drawers
pile(bot, trans=0.9) %>% draw_centroid

# if you are not happy with this, build your own !
# eg see Momocs::pile.Out (no quotes)

my_pile <- function(x, col_labels="red", transp=0.5){
    x %>% paper_chess(n=100) %>%
          draw_landmarks(transp=transp) %>%
          draw_labels(col=col_labels)
}
# using it
wings %>% my_pile(transp=3/4)

 # and as gridr functions propagate, you can even continue:
 wings %>% my_pile() %>% draw_centroid(col="blue", cex=5)

 # method on lists
 bot$coo %>% pile

 # it can be tuned when we have a list of landmarks with:
 wings$coo %>% pile(draw_fun=draw_landmarks)

 # or on arrays (turn for draw_landmarks)
 wings$coo %>% l2a %>% #we now have an array
     pile



